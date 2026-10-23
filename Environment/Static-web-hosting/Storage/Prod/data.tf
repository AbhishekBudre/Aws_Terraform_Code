#######################################################
# Route53 Hosted Zone
#######################################################

#################################################
# DNS REMOTE STATE
#################################################

data "terraform_remote_state" "dns" {

  backend = "s3"

  config = {


   bucket = "terraform-backend-bucket-1234"
    key    = "DNS/Abhishek/hosted_zone/terraform.tfstate"
    region = "ap-south-1"
  }
}

#######################################################
# ACM Remote State
#######################################################

data "terraform_remote_state" "acm_global" {

  backend = "s3"

  config = {


     bucket = "terraform-backend-bucket-1234"
    key    = "Security/Abhishek/Prod/ACM/terraform.tfstate"
    region = "ap-south-1"
  }

}