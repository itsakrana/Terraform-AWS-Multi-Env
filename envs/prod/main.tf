# -------------------------
# VPC
# -------------------------
module "vpc" {
  source = "../../Modules/vpc"

  env = "prod"

  cidr = "10.1.0.0/16"

  public_subnets = [
    "10.1.1.0/24",
    "10.1.2.0/24"
  ]

  private_subnets = [
    "10.1.11.0/24",
    "10.1.12.0/24"
  ]

  azs = [
    "ap-south-1a",
    "ap-south-1b"
  ]
}

# -------------------------
# Security Group
# -------------------------
module "sg" {
  source = "../../Modules/security-group"

  env    = "prod"
  vpc_id = module.vpc.vpc_id

  allowed_ssh_cidr = ["0.0.0.0/0"]
}

# -------------------------
# S3
# -------------------------
module "s3" {
  source = "../../Modules/s3"

  env = "prod"
}

# -------------------------
# DynamoDB
# -------------------------
module "dynamodb" {
  source = "../../Modules/dynamodb"

  env = "prod"
}

# -------------------------
# EC2
# -------------------------
module "ec2" {
  source = "../../Modules/ec2"

  env            = "prod"
  ami            = var.ami
  instance_type  = var.instance_type
  instance_count = 2

  subnet_ids = module.vpc.public_subnet_ids

  sg_id = module.sg.sg_id

  public_key_path = "../../keys/prod-key.pub"

  user_data_path = "./user-data.sh"
}