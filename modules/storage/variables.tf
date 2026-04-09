variable "resource_group_name" {
  description = "Name of the resource group."
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

variable "project_name" {
  description = "Name of the project."
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the private endpoint will be created."
  type        = string
}
