resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.project}-${var.environment}-${var.sequence}-${var.region_code}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}

resource "azurerm_subnet" "pe_snet" {
  name                                          = "snet-pe-${var.project}-${var.environment}-${var.sequence}-${var.region_code}"
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = azurerm_virtual_network.vnet.name
  address_prefixes                              = var.pe_subnet_prefix
  private_link_service_network_policies_enabled = true
}
