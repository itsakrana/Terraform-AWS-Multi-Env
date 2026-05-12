terraform {
  backend "s3" {
    bucket         = "enterprise-tf-state"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "dev-terraform-lock"
    encrypt        = true
  }
}