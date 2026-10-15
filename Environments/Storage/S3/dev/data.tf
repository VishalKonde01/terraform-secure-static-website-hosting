data "terraform_remote_state" "dns" {

  backend = "s3"

  config = {
    bucket = "terraform-backend-bucket-vishal"
    key    = "Global/DNS/test/terraform.tfstate"
    region = "ap-south-1"
  }
}

data "terraform_remote_state" "acm_global" {

  backend = "s3"

  config = {

   bucket = "terraform-backend-bucket-vishal"
    key    = "Security/ACM/global/test/terraform.tfstate"
    region = "ap-south-1"

  }

}

