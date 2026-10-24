#############################################################
# Network Remote State
#############################################################

data "terraform_remote_state" "vpc_backend" {

  backend = "s3"

  config = {

    bucket = "terraform-backend-bucket-1234"
    key    = "Network/Abhishek/dev/vpc-endpoints/terraform.tfstate"
    region = "ap-south-1"
  }
}




#############################################################
# KMS Remote State
#############################################################

data "terraform_remote_state" "kms_backend" {

  backend = "s3"

  config = {
    bucket = "terraform-backend-bucket-1234"
    key    = "Security/Abhishek/dev/kms/terraform.tfstate"
    region = "ap-south-1"
  }

}