data "terraform_remote_state" "acm_backend" {
  backend = "s3"

  config = {

   bucket = "terraform-backend-bucket-1234"
    key    = "Security/Abhishek/ALB-ACM/terraform.tfstate"
    region = "ap-south-1"
  
  }
}

data "terraform_remote_state" "vpc_backend" {
  backend = "s3"

  config = {
    bucket = "terraform-backend-bucket-1234"
    key    = "Networking/Abhishek/Vpc/ALB-PROJECT/terraform.tfstate"
    region = "ap-south-1"
  }
}

data "terraform_remote_state" "target_group_backend" {
  backend = "s3"

  config = {

    bucket = "terraform-backend-bucket-1234" # this must be your s3 bucket name
    key    = "compute/Abhishek/prod/target-group/terraform.tfstate"
    region = "ap-south-1"
  }
}

data "terraform_remote_state" "alb_backend" {
  backend = "s3"

  config = {
    bucket = "terraform-backend-bucket-1234"
    key    = "compute/Abhishek/prod/ALB/terraform.tfstate"
    region = "ap-south-1"
  }
}

