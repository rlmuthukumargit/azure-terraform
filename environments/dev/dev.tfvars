project               = "tssd365"
environment           = "dev"
location              = "westus2"
sequence             = "01"
region_code           = "wus2"
vnet_address_space    = ["172.21.20.0/24"]
pe_subnet_prefix      = ["172.21.20.0/27"]
synapse_subnet_prefix = ["172.21.20.32/27"]
allow_all_firewall      = true
storage_container_name  = "power-platform-dataflows"
tags = {
  Environment    = "dev"
  promotion_tier = "dev"
  region_code    = "wu2"
}
