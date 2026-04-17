resource "azurerm_storage_account" "main" {
  name                     = "${var.project_name}${var.environment}stg"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "main" {
  name               = "synapse"
  storage_account_id = azurerm_storage_account.main.id
}

resource "azurerm_private_endpoint" "storage" {
  name                = "${var.project_name}-${var.environment}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  lifecycle {
    ignore_changes = [tags]
  }

  private_service_connection {
    name                           = "storage-connection"
    private_connection_resource_id = azurerm_storage_account.main.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
}
