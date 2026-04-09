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

variable "storage_data_lake_gen2_filesystem_id" {
  description = "ID of the Data Lake Gen2 filesystem for Synapse."
  type        = string
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
