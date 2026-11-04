variable "srr_region" {
  description = "Region for same-region replication"
  type        = string
  default     = "ap-south-1"
}

variable "crr_region" {
  description = "Destination region for cross-region replication"
  type        = string
  default     = "ap-southeast-1"
}

variable "bucket_prefix" {
  description = "Globally unique prefix for S3 bucket names"
  type        = string
}
variable "environment" {
  type = string
}
