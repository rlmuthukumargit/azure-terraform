output "synapse_workspace_id" {
  value = azurerm_synapse_workspace.main.id
}

output "connectivity_endpoints" {
  value = azurerm_synapse_workspace.main.connectivity_endpoints
}

output "synapse_private_endpoint_sql_id" {
  value = azurerm_private_endpoint.synapse_sql.id
}

output "synapse_private_endpoint_sqlondemand_id" {
  value = azurerm_private_endpoint.synapse_sql_ondemand.id
}

output "synapse_private_endpoint_dev_id" {
  value = azurerm_private_endpoint.synapse_dev.id
}
