############################################
# Same-Region Replication (SRR)
############################################
resource "aws_s3_bucket_replication_configuration" "srr" {
  bucket = aws_s3_bucket.srr_source.id
  role   = aws_iam_role.s3_replication.arn

  rule {
    id     = "srr-all-objects"
    status = "Enabled"

    filter {}

    delete_marker_replication {
      status = "Disabled"
    }

    destination {
      bucket        = aws_s3_bucket.srr_destination.arn
      storage_class = "STANDARD"
    }
  }

  depends_on = [
    aws_s3_bucket_versioning.srr_source,
    aws_s3_bucket_versioning.srr_destination,
    aws_iam_role_policy.s3_replication
  ]
}
###################################################
# Cross-Region Replication (CRR)
###################################################
resource "aws_s3_bucket_replication_configuration" "crr" {
  bucket = aws_s3_bucket.crr_source.id
  role   = aws_iam_role.s3_replication.arn

  rule {
    id     = "crr-all-objects"
    status = "Enabled"

    filter {}

    delete_marker_replication {
      status = "Disabled"
    }

    destination {
      bucket        = aws_s3_bucket.crr_destination.arn
      storage_class = "STANDARD"
    }
  }

  depends_on = [
    aws_s3_bucket_versioning.crr_source,
    aws_s3_bucket_versioning.crr_destination,
    aws_iam_role_policy.s3_replication
  ]
}