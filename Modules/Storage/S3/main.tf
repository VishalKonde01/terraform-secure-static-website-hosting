# resource "aws_s3_bucket" "example" {
#   bucket = var.bucket_name
  
#   tags = {
#     Name        = var.bucket_tag
#     Environment = var.Environment
#   }
# }


# resource "aws_s3_bucket_versioning" "versioning_example" {
#   bucket = aws_s3_bucket.example.id
#   versioning_configuration {
#     status = var.aws_s3_bucket_versioning
#   }
# }

# # resource "aws_s3_bucket_acl" "example" {

# #  depends_on = [ aws_s3_bucket_public_access_block.example ]

# #   bucket = aws_s3_bucket.example.id
# #   acl    = var.aws_s3_bucket_acl
# # }

# resource "aws_s3_bucket_public_access_block" "example" {
#   bucket = aws_s3_bucket.example.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

############################################################
# S3 Bucket
############################################################

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = merge(
    {
      Name        = var.bucket_name
      Environment = var.Environment
    },
    var.tags
  )
}

############################################################
# Versioning
############################################################

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

############################################################
# Encryption
############################################################

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

############################################################
# Block Public Access
############################################################

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

############################################################
# Ownership Controls
############################################################

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
