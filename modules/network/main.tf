data "azurerm_resource_group" "main" {
  name = "${var.rg_prefix}rg${var.rg_suffix}"
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.project_name}-${var.environment}-vnet"
  address_space       = var.vnet_address_space
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_subnet" "main" {
  name                 = "${var.project_name}-${var.environment}-snet"
  resource_group_name  = data.azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.subnet_address_prefixes

  private_endpoint_network_policies = "Enabled"
}
