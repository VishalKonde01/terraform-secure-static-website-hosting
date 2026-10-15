module "s3_module" {
source = "../../../../modules/Storage/S3"



  bucket_name = var.bucket_name
 
  Environment = var.Environment
  #bucket_tag = var.bucket_tag

  # aws_s3_bucket_versioning = var.aws_s3_bucket_versioning

  # aws_s3_bucket_acl = var.aws_s3_bucket_acl

}

module "cdn_module" {
  source = "../../../../modules/Storage/CDN"

  bucket_name = var.bucket_name
  Environment = var.Environment

  bucket_arn = module.s3_module.bucket_arn

  bucket_regional_domain_name = module.s3_module.bucket_regional_domain_name

  aliases = [

    var.frontend_domain

  ]

  acm_certificate_arn = "arn:aws:acm:us-east-1:716663810213:certificate/ef8ab32b-0c0d-47d7-b17a-107eea74d968"
  
}


############################################################
# Route53
############################################################

resource "aws_route53_record" "frontend" {

  zone_id = data.terraform_remote_state.dns.outputs.hosted_zone_id

  name = var.frontend_domain

  type = "A"

  alias {

    name = module.cdn_module.distribution_domain_name

    zone_id = module.cdn_module.hosted_zone_id

    evaluate_target_health = false

  }

}