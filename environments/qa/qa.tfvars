project               = "tssd365syn"
environment           = "qa"
location              = "eastus"
sequence             = "01"
region_code           = "eus"
vnet_address_space    = ["172.21.20.0/24"]
pe_subnet_prefix      = ["172.21.20.0/27"]
allow_all_firewall      = true
storage_container_name  = "power-platform-dataflows"
subscription_id         = "92e46b0a-7e05-4c07-b371-33230c309831" # Placeholder
tags = {
  Environment    = "qa"
  promotion_tier = "qa"
  region_code    = "eus"
}
