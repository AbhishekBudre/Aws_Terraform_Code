variable "srr_region" {
  description = "Region for same-region replication"
  type        = string
}

variable "crr_region" {
  description = "Destination region for cross-region replication"
  type        = string
}

variable "bucket_prefix" {
  description = "Globally unique prefix for S3 bucket names"
  type        = string
}

variable "environment" {
  type = string
}
variable "project_name" {
  
}