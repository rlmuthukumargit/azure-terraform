subscription_id = "00000000-0000-0000-0000-000000000000" # Replace with your Dev Subscription ID
environment     = "dev"
project_name    = "tssd365syn"
location        = "East US"
location_short  = "eus"
instance_number = "01"

vnet_address_space      = ["10.0.0.0/16"]
subnet_address_prefixes = ["10.0.1.0/24"]

# Synapse Configuration
synapse_admin_login = "sqladmin"
# Note: synapse_admin_password is provided via environment variable in the pipeline
