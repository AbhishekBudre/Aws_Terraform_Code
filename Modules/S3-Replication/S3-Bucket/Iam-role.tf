#####################################################
# iam role for s3 bucket 
#####################################################
resource "aws_iam_role" "s3_replication" {
  name = "${var.bucket_prefix}-s3-replication-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Principal = {
        Service = "s3.amazonaws.com"
      }

      Action = "sts:AssumeRole"
    }]
  })
}

##################################################
# iam role pollicy
##################################################
resource "aws_iam_role_policy" "s3_replication" {
  name = "${var.bucket_prefix}-s3-replication-policy"
  role = aws_iam_role.s3_replication.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:GetReplicationConfiguration",
          "s3:ListBucket"
        ]

        Resource = [
          aws_s3_bucket.srr_source.arn,
          aws_s3_bucket.crr_source.arn
        ]
      },
      {
        Effect = "Allow"

        Action = [
          "s3:GetObjectVersionForReplication",
          "s3:GetObjectVersionAcl",
          "s3:GetObjectVersionTagging"
        ]

        Resource = [
          "${aws_s3_bucket.srr_source.arn}/*",
          "${aws_s3_bucket.crr_source.arn}/*"
        ]
      },
      {
        Effect = "Allow"

        Action = [
          "s3:ReplicateObject",
          "s3:ReplicateDelete",
          "s3:ReplicateTags"
        ]

        Resource = [
          "${aws_s3_bucket.srr_destination.arn}/*",
          "${aws_s3_bucket.crr_destination.arn}/*"
        ]
      }
    ]
  })
}