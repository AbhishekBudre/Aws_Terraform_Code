locals {
  common_tags = {
    Project   = var.project_name
    ManagedBy = "Terraform"
    Environment = var.environment
  }
}
#############################################
# SRR source bucket - Mumbai
#############################################
resource "aws_s3_bucket" "srr_source" {
  bucket = "${var.bucket_prefix}-srr-source"

  tags = merge(local.common_tags, {
    Name = "${var.environment}-SRR-Source"
  })
}
##############################################
# SRR destination bucket - Mumbai
##############################################
resource "aws_s3_bucket" "srr_destination" {
  bucket = "${var.bucket_prefix}-srr-destination"

  tags = merge(local.common_tags, {
    Name = "${var.environment}-SRR-Replica"
  })
}
###########################################
# CRR source bucket - Mumbai
###########################################
resource "aws_s3_bucket" "crr_source" {
  bucket = "${var.bucket_prefix}-crr-source"

  tags = merge(local.common_tags, {
    Name = "${var.environment}-CRR-Source"
  })
}
#################################################
# CRR destination bucket - Singapore
################################################
resource "aws_s3_bucket" "crr_destination" {
  provider = aws.singapore

  bucket = "${var.bucket_prefix}-crr-destination"

  tags = merge(local.common_tags, {
    Name = "${var.environment}-CRR-Replica"
  })
}

#####################################################
# Enable versioning on SRR source
#####################################################
resource "aws_s3_bucket_versioning" "srr_source" {
  bucket = aws_s3_bucket.srr_source.id

  versioning_configuration {
    status = "Enabled"
  }
}
###################################################
# Enable versioning on SRR destination
###################################################
resource "aws_s3_bucket_versioning" "srr_destination" {
  bucket = aws_s3_bucket.srr_destination.id

  versioning_configuration {
    status = "Enabled"
  }
}
################################################
# Enable versioning on CRR source
################################################
resource "aws_s3_bucket_versioning" "crr_source" {
  bucket = aws_s3_bucket.crr_source.id

  versioning_configuration {
    status = "Enabled"
  }
}
##############################################
# Enable versioning on CRR destination
#############################################
resource "aws_s3_bucket_versioning" "crr_destination" {
  provider = aws.singapore
  bucket   = aws_s3_bucket.crr_destination.id

  versioning_configuration {
    status = "Enabled"
  }
}