output "public-ip" {
 description = "this is the Ec2 instance public ip address"
   value = aws_instance.terraform.public_ip
 }
output "private_ip" {
    description = "this is the Ec2 instance private ip address"
    value = aws_instance.terraform.private_ip
}
output "public_dns" {
    description = "this is the Ec2 instance public dns"
    value = aws_instance.terraform.public_dns
}
output "private_dns" {
    description = "this is the Ec2 instance private dns"
    value = aws_instance.terraform.private_dns

}
output "instance_id" {
    description ="this is the Ec2 instance id"
    value = aws_instance.terraform.id
}
output "instance_arn" {
    description ="this is the Ec2 instance arn"
    value = aws_instance.terraform.arn
}
output "instance_tags" {
    description = "this is the Ec2 instance tags"
    value = aws_instance.terraform.tags
}