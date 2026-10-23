terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket-1234"
    key    = "DNS/Abhishek/hosted_zone/terraform.tfstate"
    region = "ap-south-1"
  }
}
