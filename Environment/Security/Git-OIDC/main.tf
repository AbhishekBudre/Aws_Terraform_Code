#############################################################
# LOCALS
#############################################################

locals {

  common_tags = {

    Environment = var.environment

    Project = var.project_name

    ManagedBy = "Terraform"

  }

}

#############################################################
# GITHUB OIDC PROVIDER
#############################################################

module "github_oidc_provider" {

  source = "../../../modules/security/github-oidc/github-oidc-provider"

  common_tags = local.common_tags
  aws_region = var.aws_region

}

#############################################################
# TERRAFORM ROLE
#############################################################

module "terraform_role" {

  source = "../../../modules/security/github-oidc/github-oidc-role"

  role_name = "${var.project_name}-terraform-role"

  policy_name = "terraform-policy"
aws_region = var.aws_region
  github_owner = var.github_owner

  github_repository = var.terraform_repository

  oidc_provider_arn = module.github_oidc_provider.oidc_provider_arn

  policy_template_file = "../../../modules/security/github-oidc/github-oidc-role/templates/terraform-policy.json"

  backend_branch   = var.backend_branch
  terraform_branch = var.terraform_branch
  frontend_branch  = var.frontend_branch

  github_branch      = var.github_branch
  github_environment = var.github_environment

}

#############################################################
# FRONTEND ROLE
#############################################################

module "frontend_role" {

  source = "../../../modules/security/github-oidc/github-oidc-role"
aws_region = var.aws_region
  role_name = "${var.project_name}-frontend-role"

  policy_name = "frontend-policy"

  github_owner = var.github_owner

  github_repository = var.frontend_repository

  oidc_provider_arn = module.github_oidc_provider.oidc_provider_arn

  policy_template_file = "../../../modules/security/github-oidc/github-oidc-role/templates/frontend-policy.json"

  backend_branch   = var.backend_branch
  terraform_branch = var.terraform_branch
  frontend_branch  = var.frontend_branch

  github_branch = var.github_branch

  github_environment = var.github_environment

}

#############################################################
# BACKEND ROLE
#############################################################

module "backend_role" {

  source = "../../../modules/security/github-oidc/github-oidc-role"

  role_name   = "${var.project_name}-backend-role"
  policy_name = "backend-policy"
aws_region = var.aws_region
  github_owner = var.github_owner

  github_repository = var.backend_repository

  oidc_provider_arn = module.github_oidc_provider.oidc_provider_arn

  policy_template_file = "../../../modules/security/github-oidc/github-oidc-role/templates/backend-policy.json"

  common_tags = local.common_tags

  backend_branch   = var.backend_branch
  terraform_branch = var.terraform_branch
  frontend_branch  = var.frontend_branch

  github_branch = var.github_branch

  github_environment = var.github_environment
}