terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket-1234"
    key    = "Security/Abhishek/Prod/ACM/terraform.tfstate"
    region = "ap-south-1"
  }
}
