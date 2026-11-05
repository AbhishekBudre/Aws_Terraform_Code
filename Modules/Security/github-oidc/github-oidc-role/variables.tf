variable "aws_region" {
  type = string
}
#############################################################
# IAM ROLE NAME
#############################################################

variable "role_name" {

  description = "IAM Role Name"

  type = string

}

#############################################################
# IAM POLICY NAME
#############################################################

variable "policy_name" {

  description = "IAM Policy Name"

  type = string

}

#############################################################
# POLICY TEMPLATE
#############################################################

variable "policy_template_file" {

  description = "IAM Policy Template"

  type = string

}

#############################################################
# OIDC PROVIDER ARN
#############################################################

variable "oidc_provider_arn" {

  description = "GitHub OIDC Provider ARN"

  type = string

}

#############################################################
# GITHUB OWNER
#############################################################

variable "github_owner" {

  description = "GitHub Organization/User"

  type = string

}

#############################################################
# GITHUB REPOSITORY
#############################################################

variable "github_repository" {

  description = "GitHub Repository"

  type = string

}

#############################################################
# COMMON TAGS
#############################################################

variable "common_tags" {

  description = "Common Tags"

  type = map(string)

  default = {}

}

#############################################################
# GITHUB BRANCH
#############################################################

variable "github_branch" {

  description = "GitHub branch allowed to assume this role"

  type = string


}



variable "terraform_branch" {

}

variable "frontend_branch" {

}

variable "backend_branch" {

}
#############################################################
# GITHUB ENVIRONMENT
#############################################################

variable "github_environment" {

  description = "GitHub Environment Name"

  type = string

}