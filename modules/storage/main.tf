resource "azurerm_storage_account" "st" {
  name                     = "st${var.project}${var.environment}${var.sequence}${var.region_code}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = true
  access_tier              = "Hot"
  
  tags = var.tags
}

resource "azurerm_storage_container" "container" {
  name                  = "power-platform-dataflows"
  storage_account_name  = azurerm_storage_account.st.name
  container_access_type = "private"
}

resource "azurerm_private_endpoint" "pe" {
  name                = "pepst-${var.project}-${var.environment}-${var.sequence}-${var.region_code}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "pepst-${var.project}-${var.environment}-${var.sequence}-${var.region_code}-psc"
    private_connection_resource_id = azurerm_storage_account.st.id
    is_manual_connection           = false
    subresource_names              = ["dfs"]
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
