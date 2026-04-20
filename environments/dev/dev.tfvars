project               = "tssd365syn"
environment           = "dev"
location              = "eastus"
sequence             = "01"
region_code           = "eus"
vnet_address_space    = ["172.21.20.0/24"]
pe_subnet_prefix      = ["172.21.20.0/27"]
synapse_subnet_prefix = ["172.21.20.32/27"]
allow_all_firewall      = true
storage_container_name  = "power-platform-dataflows"
tags = {
  Environment    = "dev"
  promotion_tier = "dev"
  region_code    = "eus"
}
