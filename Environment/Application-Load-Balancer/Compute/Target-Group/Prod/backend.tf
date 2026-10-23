terraform {
  backend "s3" {

    bucket = "terraform-backend-bucket-1234" # this must be your s3 bucket name
    key    = "compute/Abhishek/prod/target-group/terraform.tfstate"
    region = "ap-south-1"
  }
}