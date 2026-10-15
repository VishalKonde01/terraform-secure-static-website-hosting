terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket-vishal"
    key    = "Security/ACM/global/test/terraform.tfstate"
    region = "ap-south-1"
  }
}