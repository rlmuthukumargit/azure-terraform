variable "environment" {
  description = "The target deployment environment (e.g., dev, qa, prod)."
  type        = string
}

variable "subscription_id" {
  description = "The Azure Subscription ID (Mandatory for AzureRM v4.0)."
  type        = string
}

variable "project_name" {
  description = "A prefix for all resource names."
  type        = string
}

variable "location" {
  description = "Azure region for the resources."
  type        = string
}

variable "location_short" {
  description = "Short name for the location (e.g., wus2, eus)."
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network."
  type        = list(string)
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet."
  type        = list(string)
}

variable "synapse_admin_login" {
  description = "Administrator login for Synapse workspace."
  type        = string
}

variable "synapse_admin_password" {
  description = "Administrator password for Synapse workspace."
  type        = string
  sensitive   = true
}
