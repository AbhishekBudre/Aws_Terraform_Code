terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket-1234"
    key    = "compute/Abhishek/prod/Launch-Templete/terraform.tfstate"
    region = "ap-south-1"
  }
}
