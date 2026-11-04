output "srr_source_bucket" {
  value = aws_s3_bucket.srr_source.bucket
}

output "srr_destination_bucket" {
  value = aws_s3_bucket.srr_destination.bucket
}

output "crr_source_bucket" {
  value = aws_s3_bucket.crr_source.bucket
}

output "crr_destination_bucket" {
  value = aws_s3_bucket.crr_destination.bucket
}

output "replication_role_arn" {
  value = aws_iam_role.s3_replication.arn
}