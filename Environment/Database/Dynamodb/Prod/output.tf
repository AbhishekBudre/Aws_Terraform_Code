output "dynmodb_table_arn" {
  value = module.dynomodb_user_module.dynomodb_table_arn
}
output "dynamodb_table_name" {
  value = module.dynomodb_user_module.dynamodb_table_name
}

output "student_data" {
  value = module.dynomodb_user_module.student_data
}
output "dynamodb_resource_policy" {
  value = module.dynomodb_user_module.dynamodb_resource_policy
}