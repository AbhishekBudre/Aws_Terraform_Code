#############################################################
# IAM ROLE
#############################################################

output "role_name" {

  description = "IAM Role Name"

  value = aws_iam_role.this.name

}

output "role_arn" {

  description = "IAM Role ARN"

  value = aws_iam_role.this.arn

}

#############################################################
# IAM POLICY
#############################################################

output "policy_name" {

  description = "IAM Policy Name"

  value = aws_iam_policy.this.name

}

output "policy_arn" {

  description = "IAM Policy ARN"

  value = aws_iam_policy.this.arn

}