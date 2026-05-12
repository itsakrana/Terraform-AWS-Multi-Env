# -------------------------
# VPC
# -------------------------
module "vpc" {
  source = "../../Modules/vpc"

  env = "dev"

  cidr = "10.0.0.0/16"

  public_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnets = [
    "10.0.11.0/24",
    "10.0.12.0/24"
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
  source = "../../modules/security-group"

  env    = "dev"
  vpc_id = module.vpc.vpc_id

  allowed_ssh_cidr = ["0.0.0.0/0"]
}

# -------------------------
# S3
# -------------------------
module "s3" {
  source = "../../Modules/s3"

  env = "dev"
}

# -------------------------
# DynamoDB
# -------------------------
module "dynamodb" {
  source = "../../Modules/dynamodb"

  env = "dev"
}

# -------------------------
# EC2
# -------------------------
module "ec2" {
  source = "../../Modules/ec2"

  env            = "dev"
  ami            = var.ami
  instance_type  = var.instance_type
  instance_count = 2

  subnet_ids = Modules.vpc.public_subnet_ids

  sg_id = Modules.sg.sg_id

  public_key_path = "../../keys/dev-key.pub"

  user_data_path = "./user-data.sh"
}