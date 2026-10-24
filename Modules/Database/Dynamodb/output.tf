output "dynomodb_table_arn" {
  value = aws_dynamodb_table.users_dynamodb_table.arn
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.users_dynamodb_table.name
}

output "student_data" {
  value = aws_dynamodb_table_item.users_dynamodb_table.item
}

output "dynamodb_resource_policy" {
  description = "DynamoDB resource policy JSON"
  value       = data.aws_iam_policy_document.dynamodb_user_policy.json
}