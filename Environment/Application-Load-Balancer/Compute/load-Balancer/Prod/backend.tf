terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket-1234"
    key    = "compute/Abhishek/prod/ALB/terraform.tfstate"
    region = "ap-south-1"
  }
}
