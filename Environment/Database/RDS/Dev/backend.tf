terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket-1234"
    key    = "Storage/Abhishek/dev/psql/terraform.tfstate"
    region = "ap-south-1"
  }
}