#############################################################
# OIDC PROVIDER URL
#############################################################

variable "oidc_provider_url" {

  description = "GitHub OIDC Provider URL"

  type = string

  default = "https://token.actions.githubusercontent.com"

}

#############################################################
# CLIENT IDS
#############################################################

variable "client_id_list" {

  description = "OIDC Client IDs"

  type = list(string)

  default = [

    "sts.amazonaws.com"

  ]

}

#############################################################
# COMMON TAGS
#############################################################

variable "common_tags" {

  description = "Common Tags"

  type = map(string)

  default = {}

}

variable "aws_region" {
  
}