terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket-1234"
    key    = "Networking/Abhishek/Vpc/ALB-PROJECT/terraform.tfstate"
    region = "ap-south-1"
  }
}
