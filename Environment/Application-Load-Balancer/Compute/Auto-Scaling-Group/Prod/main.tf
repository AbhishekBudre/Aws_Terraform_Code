#################################################
# ACM MODULE
#################################################

module "asg" {

  source = "../../../../../Modules/Application-Load-Balancer/Compute/Auto-Scaling-Group"

environment = var.environment

project_name = var.project_name
launch_template_id = data.terraform_remote_state.launch_templete_backend.outputs.launch_template_id
 private_subnet_ids = data.terraform_remote_state.vpc_backend.outputs.private_subnet_ids
 target_group_arn = data.terraform_remote_state.target_group_backend.outputs.target_group_arn
 launch_template_latest_version = data.terraform_remote_state.launch_templete_backend.outputs.launch_template_latest_version
 aws_region = var.aws_region


}