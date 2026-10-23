terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket-1234"
    key    = "Security/Abhishek/ALB-ACM/terraform.tfstate"
    region = "ap-south-1"
  }
}