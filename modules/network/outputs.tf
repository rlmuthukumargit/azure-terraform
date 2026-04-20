output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "pe_subnet_id" {
  value = azurerm_subnet.pe_snet.id
}
