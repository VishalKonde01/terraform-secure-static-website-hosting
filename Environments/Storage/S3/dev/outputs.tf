output "bucket_name" {
  value = module.s3_module.bucket_name
}

output "cloudfront_distribution_id" {
  description = "CloudFront Distribution ID"
  value       = module.cdn_module.distribution_arn
}

output "cloudfront_domain" {
  description = "CloudFront domain name"
  value       = module.cdn_module.distribution_domain_name
}

output "frontend_url" {
  description = "Frontend custom domain"
  value       = "https://${var.frontend_domain}"
}