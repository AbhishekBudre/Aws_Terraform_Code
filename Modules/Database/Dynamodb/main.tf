#######################################
## Dynomodb Table Block
#######################################

resource "aws_dynamodb_table" "users_dynamodb_table" {
  name           = var.name
  billing_mode   = var.billing_mode

  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity

  hash_key       = var.hash_key
  range_key      = var.range_key

  attribute {
    name = var.attribute_name
    type = var.attribute_type
  }

  attribute {
    name = var.range_attribute_name
    type = var.range_attribute_type
  }

  tags = {
    Name        = var.dynomodb_table_name
    Environment = var.environment
  }
}

#######################################
## DynamoDB Table Item Block
#######################################

resource "aws_dynamodb_table_item" "users_dynamodb_table" {
  table_name = aws_dynamodb_table.users_dynamodb_table.name
  hash_key   = aws_dynamodb_table.users_dynamodb_table.hash_key
  range_key  = aws_dynamodb_table.users_dynamodb_table.range_key

  item = jsonencode({
    (var.attribute_name) = {
      (var.attribute_type == "S" ? "S" : "N") = (
        var.attribute_type == "S" ? "USER001" : "101"
      )
    }

    (var.range_attribute_name) = {
      (var.range_attribute_type == "S" ? "S" : "N") = (
        var.range_attribute_type == "S" ? "Game001" : "1"
      )
    }

    UserName = {
      S = "Abhishek"
    }

    GameTitle = {
      S = "Cricket"
    }

    Score = {
      N = "100"
    }
  })
}

##############################################
## DynamodbTable Iam User Pollicy Block
##############################################

data "aws_iam_policy_document" "dynamodb_user_policy" {
  statement {
    effect = "Allow"

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::667173675235:user/abhishek-b"
      ]
    }

    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:UpdateItem",
      "dynamodb:DeleteItem",
      "dynamodb:Query",
      "dynamodb:Scan"
    ]

    resources = [
      aws_dynamodb_table.users_dynamodb_table.arn
    ]
  }
}

resource "aws_dynamodb_resource_policy" "users_policy" {
  resource_arn = aws_dynamodb_table.users_dynamodb_table.arn
  policy       = data.aws_iam_policy_document.dynamodb_user_policy.json
}