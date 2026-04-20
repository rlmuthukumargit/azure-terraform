subscription_id = "00000000-0000-0000-0000-000000000000" # Replace with your Prod Subscription ID
environment     = "prod"
project_name    = "tssd365syn"
location        = "East US"
location_short  = "eus"
instance_number = "01"

vnet_address_space      = ["10.2.0.0/16"]
subnet_address_prefixes = ["10.2.1.0/24"]

# Synapse Configuration
synapse_admin_login = "sqladmin"
# Note: synapse_admin_password is provided via environment variable in the pipeline
