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

variable "rg_prefix" {
  description = "Prefix for the Resource Group name."
  type        = string
}

variable "rg_suffix" {
  description = "Suffix for the Resource Group name."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the private endpoint will be created."
  type        = string
}
