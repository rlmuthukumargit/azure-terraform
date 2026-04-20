module "resource_group" {
  source      = "./modules/resource_group"
  project     = var.project
  environment = var.environment
  location    = var.location
  sequence    = var.sequence
  region_code = var.region_code
  tags        = var.tags
}

module "network" {
  source                = "./modules/network"
  resource_group_name   = module.resource_group.name
  project               = var.project
  environment           = var.environment
  location              = var.location
  sequence              = var.sequence
  region_code           = var.region_code
  address_space         = var.vnet_address_space
  pe_subnet_prefix      = var.pe_subnet_prefix
  synapse_subnet_prefix = var.synapse_subnet_prefix
  tags                  = var.tags
}

module "storage" {
  source               = "./modules/storage"
  resource_group_name  = module.resource_group.name
  project              = var.project
  environment          = var.environment
  location             = var.location
  sequence             = var.sequence
  region_code          = var.region_code
  subnet_id            = module.network.pe_subnet_id
  container_name       = var.storage_container_name
  private_dns_zone_ids = var.private_dns_zone_ids
  tags                 = var.tags
}

module "synapse" {
  source                               = "./modules/synapse"
  resource_group_name                  = module.resource_group.name
  project                              = var.project
  environment                          = var.environment
  location                             = var.location
  sequence                             = var.sequence
  region_code                          = var.region_code
  storage_data_lake_gen2_filesystem_id = "${module.storage.primary_dfs_endpoint}${module.storage.container_name}"
  allow_all_firewall                   = var.allow_all_firewall
  subnet_id                            = module.network.synapse_subnet_id
  private_dns_zone_ids                 = var.private_dns_zone_ids
  tags                                 = var.tags
}
