output "synapse_workspace_id" {
  value = azurerm_synapse_workspace.main.id
}

output "connectivity_endpoints" {
  value = azurerm_synapse_workspace.main.connectivity_endpoints
}
