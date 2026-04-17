resource "azurerm_virtual_network" "main" {
  name                = "${var.project_name}-${var.environment}-vnet"
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_subnet" "main" {
  name                 = "${var.project_name}-${var.environment}-snet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.subnet_address_prefixes

  private_endpoint_network_policies = "Enabled"
}
