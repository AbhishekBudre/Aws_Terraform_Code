terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket-1234"
    key    = "Static-Website/Abhishek/Prod/S3&CDN/terraform.tfstate"
    region = "ap-south-1"
  }
}