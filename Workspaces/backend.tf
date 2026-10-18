terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket-1234"
    key    = "compute/Abhi/dev/workspaces/terraform.tfstate"
    region = "ap-south-1"
  }
}