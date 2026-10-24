terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket-1234"
    key    = "lambada/Abhishek/prod/ec2-start-stop/terraform.tfstate"
    region = "ap-south-1"
  }
}