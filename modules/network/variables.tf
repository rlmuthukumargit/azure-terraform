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

variable "address_space" {
  description = "VNet address space"
  type        = list(string)
}

variable "pe_subnet_prefix" {
  description = "Address prefix for the Private Endpoint subnet"
  type        = list(string)
}

variable "synapse_subnet_prefix" {
  description = "Address prefix for the Synapse subnet"
  type        = list(string)
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
