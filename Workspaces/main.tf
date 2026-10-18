#######################################
## Ec2 Instance Resource Block
#######################################

resource "aws_instance" "terraform" {
  ami           = var.instance_ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  key_name = var.key_name
  

  tags = {
    Name = "${var.environment}-web-server"
    Environment = var.environment
  }
}