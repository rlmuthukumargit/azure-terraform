resource "azurerm_synapse_workspace" "main" {
  name                                 = "${var.project_name}-${var.environment}-syn"
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id   = var.storage_data_lake_gen2_filesystem_id
  sql_administrator_login              = var.synapse_admin_login
  sql_administrator_login_password     = var.synapse_admin_password
  managed_virtual_network_enabled      = false
  public_network_access_enabled        = true

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [tags]
  }
}
