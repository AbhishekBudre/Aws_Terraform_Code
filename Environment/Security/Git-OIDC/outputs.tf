#############################################################
# OIDC
#############################################################

output "oidc_provider_arn" {

  value = module.github_oidc_provider.oidc_provider_arn

}

#############################################################
# TERRAFORM
#############################################################

output "terraform_role_arn" {

  value = module.terraform_role.role_arn

}

#############################################################
# FRONTEND
#############################################################

output "frontend_role_arn" {

  value = module.frontend_role.role_arn

}

#############################################################
# BACKEND
#############################################################

output "backend_role_arn" {

  value = module.backend_role.role_arn

}