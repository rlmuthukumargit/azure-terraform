resource "azurerm_synapse_workspace" "syn" {
  name                                 = "syn-${var.project}-${var.environment}-${var.sequence}-${var.region_code}"
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  managed_resource_group_name          = "rg-managed-${var.project}-${var.environment}-${var.sequence}-${var.region_code}"
  storage_data_lake_gen2_filesystem_id = var.storage_data_lake_gen2_filesystem_id
  sql_administrator_login              = var.sql_administrator_login
  sql_administrator_login_password     = var.sql_administrator_login_password

  managed_virtual_network_enabled = true
  public_network_access_enabled   = false
  
  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

# Firewall Rules
resource "azurerm_synapse_firewall_rule" "allow_all" {
  count                = var.allow_all_firewall ? 1 : 0
  name                 = "allowAll"
  synapse_workspace_id = azurerm_synapse_workspace.syn.id
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "255.255.255.255"
}

resource "azurerm_synapse_firewall_rule" "restricted" {
  for_each             = { for x in var.restricted_ips : x.name => x if !var.allow_all_firewall }
  name                 = each.value.name
  synapse_workspace_id = azurerm_synapse_workspace.syn.id
  start_ip_address     = each.value.start_ip_address
  end_ip_address       = each.value.end_ip_address
}

# Additional Resources from Images
resource "azurerm_synapse_workspace_extended_auditing_policy" "audit" {
  synapse_workspace_id   = azurerm_synapse_workspace.syn.id
  log_monitoring_enabled = false
  retention_in_days      = 0
}

resource "azurerm_synapse_integration_runtime_azure" "ir" {
  name                 = "AutoResolveIntegrationRuntime"
  synapse_workspace_id = azurerm_synapse_workspace.syn.id
  location             = "AutoResolve"
}

resource "azurerm_synapse_workspace_security_alert_policy" "alert" {
  synapse_workspace_id = azurerm_synapse_workspace.syn.id
  policy_state         = "Enabled"
  retention_days       = 0
}

resource "azurerm_synapse_workspace_vulnerability_assessment" "va" {
  workspace_security_alert_policy_id = azurerm_synapse_workspace_security_alert_policy.alert.id
  storage_container_path             = var.storage_container_path
  # recurring_scans {}
}

# Private Endpoints for Synapse
resource "azurerm_private_endpoint" "syn_pe" {
  for_each            = toset(["Sql", "SqlOnDemand", "Dev"])
  name                = "pe-syn-${lower(each.value)}-${var.project}-${var.environment}-${var.sequence}-${var.region_code}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "pe-syn-${lower(each.value)}-${var.project}-${var.environment}-${var.sequence}-${var.region_code}-psc"
    private_connection_resource_id = azurerm_synapse_workspace.syn.id
    is_manual_connection           = false
    subresource_names              = [each.value]
  }

  dynamic "private_dns_zone_group" {
    for_each = length(var.private_dns_zone_ids) > 0 ? [1] : []
    content {
      name                = "deployedByPolicy"
      private_dns_zone_ids = var.private_dns_zone_ids
    }
  }

  tags = var.tags
}
