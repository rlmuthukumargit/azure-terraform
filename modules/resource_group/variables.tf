variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment (e.g. dev, prod)"
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
  description = "Region code for naming (e.g. wus2)"
  type        = string
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
