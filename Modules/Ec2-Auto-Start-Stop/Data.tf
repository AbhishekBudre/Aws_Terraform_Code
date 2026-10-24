data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
   bucket = "terraform-backend-bucket-1234"
    key    = "Network/Abhishek/dev/vpc-endpoints/terraform.tfstate"
    region = "ap-south-1"
  }
}