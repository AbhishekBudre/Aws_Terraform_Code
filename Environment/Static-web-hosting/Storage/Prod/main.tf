############################################################
# S3
############################################################

module "frontend_bucket" {

  source = "../../../../Modules/Static-web-hosting/S3"


  bucket_name = var.bucket_name

  environment = var.environment

}

############################################################
# CloudFront
############################################################

module "cloudfront" {

  source = "../../../../Modules/Static-web-hosting/CDN"
  aws_region =  var.aws_region
  bucket_name = module.frontend_bucket.bucket_name

  bucket_arn = module.frontend_bucket.bucket_arn

  bucket_regional_domain_name = module.frontend_bucket.bucket_regional_domain_name

  aliases = [

    var.frontend_domain

  ]

  acm_certificate_arn = "arn:aws:acm:us-east-1:667173675235:certificate/ec5aa4cc-8fbe-41ec-bd44-78cb1da2035f"

  environment = var.environment
  

}

# ############################################################
# # Route53
# ############################################################

resource "aws_route53_record" "frontend" {

  zone_id = data.terraform_remote_state.dns.outputs.module_hosted_zone_id

  name = var.frontend_domain

  type = "A"

  alias {

    name = module.cloudfront.distribution_domain_name

    zone_id = module.cloudfront.hosted_zone_id

    evaluate_target_health = false

  }

}