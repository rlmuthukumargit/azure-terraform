project               = "tssd365syn"
environment           = "dev"
location              = "eastus"
sequence             = "01"
region_code           = "eus"
vnet_address_space    = ["172.21.20.0/24"]
pe_subnet_prefix      = ["172.21.20.0/27"]
allow_all_firewall      = true
tags = {
  Environment    = "dev"
  promotion_tier = "dev"
  region_code    = "eus"
}
