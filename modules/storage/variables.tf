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
}

variable "region_code" {
  description = "Region code"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for Private Endpoint"
  type        = string
}

variable "private_dns_zone_ids" {
  description = "Private DNS Zone IDs for the Private Endpoint"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
