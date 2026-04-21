variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "sequence" {
  description = "Sequence number"
  type        = string
  default     = "01"
}

variable "region_code" {
  description = "Region code"
  type        = string
}

variable "allow_all_firewall" {
  description = "Whether to allow all traffic to Synapse"
  type        = bool
  default     = false
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "pe_subnet_prefix" {
  description = "Address prefix for the Private Endpoint subnet"
  type        = list(string)
}

variable "private_dns_zone_ids" {
  description = "Private DNS Zone IDs"
  type        = list(string)
  default     = []
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
