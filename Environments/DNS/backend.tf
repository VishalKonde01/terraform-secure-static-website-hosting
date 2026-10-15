terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket-vishal"
    key    = "Global/DNS/test/terraform.tfstate"
    region = "ap-south-1"
  }
}