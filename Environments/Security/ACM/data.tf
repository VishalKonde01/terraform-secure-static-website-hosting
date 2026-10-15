data "terraform_remote_state" "DNS_backend" {
  
backend = "s3"

config = {
  bucket = "terraform-backend-bucket-vishal"
    key    = "Global/DNS/test/terraform.tfstate"
    region = "ap-south-1"
}

}