subscription_id = "00000000-0000-0000-0000-000000000000" # Replace with your Dev Subscription ID
environment     = "dev"
project_name    = "adfdemo"
location        = "East US 2"
location_short  = "eus2"

# Resource Group Naming
rg_prefix = "company-" 
rg_suffix = "-01"

vnet_address_space      = ["10.0.0.0/16"]
subnet_address_prefixes = ["10.0.1.0/24"]

# Synapse Configuration
synapse_admin_login = "sqladmin"
# Note: synapse_admin_password is provided via environment variable in the pipeline
