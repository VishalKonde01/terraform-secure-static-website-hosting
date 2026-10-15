module "s3_module" {
source = "../../../../modules/Storage/S3"



  bucket_name = var.bucket_name

  Environment = var.Environment
  bucket_tag = var.bucket_tag

  aws_s3_bucket_versioning = var.aws_s3_bucket_versioning

  aws_s3_bucket_acl = var.aws_s3_bucket_acl
}