#############################################################
# OIDC PROVIDER ARN
#############################################################

output "oidc_provider_arn" {

  description = "GitHub OIDC Provider ARN"

  value = aws_iam_openid_connect_provider.github.arn

}

#############################################################
# OIDC PROVIDER URL
#############################################################

output "oidc_provider_url" {

  description = "GitHub OIDC Provider URL"

  value = aws_iam_openid_connect_provider.github.url

}

#############################################################
# CLIENT IDS
#############################################################

output "client_id_list" {

  description = "OIDC Client IDs"

  value = aws_iam_openid_connect_provider.github.client_id_list

}