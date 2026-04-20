project               = "tssd365syn"
environment           = "qa"
location              = "eastus"
sequence             = "01"
region_code           = "eus"
vnet_address_space    = ["172.21.20.0/24"]
pe_subnet_prefix      = ["172.21.20.0/27"]
allow_all_firewall      = true
tags = {
  Environment    = "qa"
  promotion_tier = "qa"
  region_code    = "eus"
}
