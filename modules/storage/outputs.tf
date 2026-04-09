output "storage_account_id" {
  value = azurerm_storage_account.main.id
}

output "primary_dfs_endpoint" {
  value = azurerm_storage_account.main.primary_dfs_endpoint
}

output "data_lake_gen2_filesystem_id" {
  value = azurerm_storage_data_lake_gen2_filesystem.main.id
}

output "data_lake_gen2_filesystem_name" {
  value = azurerm_storage_data_lake_gen2_filesystem.main.name
}
