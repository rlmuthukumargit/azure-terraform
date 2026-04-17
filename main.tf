resource "azurerm_resource_group" "main" {
  name     = "${var.rg_prefix}rg${var.rg_suffix}"
  location = var.location

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [tags]
  }
}

module "network" {
  source = "./modules/network"

  resource_group_name     = azurerm_resource_group.main.name
  location                = azurerm_resource_group.main.location
  location_short          = var.location_short
  project_name            = var.project_name
  environment             = var.environment
  rg_prefix               = var.rg_prefix
  rg_suffix               = var.rg_suffix
  vnet_address_space      = var.vnet_address_space
  subnet_address_prefixes = var.subnet_address_prefixes
}

module "storage" {
  source = "./modules/storage"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  location_short      = var.location_short
  project_name        = var.project_name
  environment         = var.environment
  rg_prefix           = var.rg_prefix
  rg_suffix           = var.rg_suffix
  subnet_id           = module.network.subnet_id
}

module "synapse" {
  source = "./modules/synapse"

  resource_group_name                  = azurerm_resource_group.main.name
  location                             = azurerm_resource_group.main.location
  location_short                       = var.location_short
  project_name                         = var.project_name
  environment                          = var.environment
  rg_prefix                            = var.rg_prefix
  rg_suffix                            = var.rg_suffix
  storage_data_lake_gen2_filesystem_id = module.storage.data_lake_gen2_filesystem_id
  synapse_admin_login                  = var.synapse_admin_login
  synapse_admin_password               = var.synapse_admin_password
  subnet_id                            = module.network.subnet_id
}
