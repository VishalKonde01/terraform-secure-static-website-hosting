terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket-vishal"
    key    = "Storage/s3-bucket/uat/test/terraform.tfstate"
    region = "ap-south-1"
  }
}