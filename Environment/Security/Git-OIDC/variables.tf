#################################################
# AWS
#################################################

variable "aws_region" {

  type = string

  default = "ap-south-1"
}

#############################################################
# ENVIRONMENT
#############################################################

variable "environment" {

  type = string

}

#############################################################
# PROJECT
#############################################################

variable "project_name" {

  type = string

}

#############################################################
# GITHUB OWNER
#############################################################

variable "github_owner" {

  type = string

}

variable "terraform_repository" {

  type = string

}

variable "frontend_repository" {

}

variable "backend_repository" {

}

variable "github_branch" {

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