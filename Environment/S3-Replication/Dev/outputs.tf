output "srr_source_bucket" {
  value = module.s3_bucket_module.srr_source_bucket
}

output "srr_destination_bucket" {
  value = module.s3_bucket_module.srr_destination_bucket
}

output "crr_source_bucket" {
  value = module.s3_bucket_module.crr_source_bucket
}

output "crr_destination_bucket" {
  value = module.s3_bucket_module.crr_destination_bucket
}

output "replication_role_arn" {
  value = module.s3_bucket_module
}