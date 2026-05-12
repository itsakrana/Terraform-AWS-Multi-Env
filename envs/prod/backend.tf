terraform {
  backend "s3" {
    bucket         = "enterprise-tf-state"
    key            = "prod/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "prod-terraform-lock"
    encrypt        = true
  }
}