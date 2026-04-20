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

variable "storage_data_lake_gen2_filesystem_id" {
  description = "The ID of the Data Lake Gen2 Filesystem"
  type        = string
}

variable "sql_administrator_login" {
  description = "SQL administrator login"
  type        = string
  default     = "sqladminuser"
}

variable "allow_all_firewall" {
  description = "Whether to allow all traffic to Synapse"
  type        = bool
  default     = false
}

variable "restricted_ips" {
  description = "List of allowed IP ranges if not allowing all"
  type        = list(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
  default = []
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}

variable "storage_container_path" {
  description = "The path of Container"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "Subnet ID for Synapse Private Endpoints"
  type        = string
}

variable "private_dns_zone_ids" {
  description = "Private DNS Zone IDs"
  type        = list(string)
  default     = []
}
