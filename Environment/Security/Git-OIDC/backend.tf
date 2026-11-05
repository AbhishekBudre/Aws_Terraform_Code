terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket-1234"
    key    = "OIDC/Abhishek/CICD/terraform.tfstate"
    region = "ap-south-1"
  }
}