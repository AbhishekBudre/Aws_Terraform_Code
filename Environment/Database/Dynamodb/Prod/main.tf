module "dynomodb_user_module" {
  source = "../../../../Modules/Database/Dynamodb"
  
  range_key = var.range_key
  hash_key =  var.hash_key

  range_attribute_name = var.range_attribute_name
  range_attribute_type = var.attribute_type

  attribute_name = var.attribute_name
  attribute_type = var.attribute_type

  read_capacity = var.read_capacity
  write_capacity = var.write_capacity

  billing_mode = var.billing_mode

  dynomodb_table_name = var.dynomodb_table_name
  environment = var.environment
  aws_region = var.aws_region
  name = var.name

}