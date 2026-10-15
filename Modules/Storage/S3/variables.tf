# variable "bucket_name" {
#   type = string
# }

# variable "Environment" {
#  type = string
# }

# variable "bucket_tag" {
#   type = string
# }

# variable "aws_s3_bucket_versioning" {
#   type = string
# }

# variable "aws_s3_bucket_acl" {
#   type = string
# }

variable "aws_region" {
  default = "ap-south-1"
}

variable "bucket_name" {
  type = string
}

variable "Environment" {
  type    = string
  default = "dev"
}

variable "tags" {
  type    = map(string)
  default = {}
}