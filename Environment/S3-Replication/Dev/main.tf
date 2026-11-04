module "s3_bucket_module" {
  source = "../../../Modules/S3-Replication/S3-Bucket"
  srr_region = var.srr_region
  crr_region = var.crr_region
  bucket_prefix = var.bucket_prefix
  environment = var.environment
}

module "s3_replication" {
  source = "../../../Modules/S3-Replication/Replection"

  providers = {
    aws           = aws
    aws.singapore = aws.singapore
  }

  bucket_prefix = "${var.bucket_prefix}-${var.environment}"
  srr_region    = var.srr_region
  crr_region    = var.crr_region
  environment = var.environment
}