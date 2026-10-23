#################################################
# ENVIRONMENT
#################################################

environment = "prod"

#################################################
# PROJECT
#################################################

project_name = "prod-web-app"

aws_region = "ap-south-1"
hosted_zone_name = "theabhi.space" # add your hosted zone name which is in route-53 
dns_name_to_access_alb = "prod.theabhi.space" # this must be <name>.doamin_name ex: dev.space9.in