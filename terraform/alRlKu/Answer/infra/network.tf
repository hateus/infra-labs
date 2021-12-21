module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.11.0"

  name               = "production-vpc-${random_pet.end_string.id}"
  cidr               = "10.20.20.0/23"
  azs                = ["us-east-1a", "us-east-1b"]
  private_subnets    = ["10.20.20.0/26", "10.20.20.64/26"]
  database_subnets   = ["10.20.20.128/26", "10.20.20.192/26"]
  public_subnets     = ["10.20.21.0/25", "10.20.21.128/25"]
  enable_nat_gateway = true
  single_nat_gateway = true

  igw_tags = {
    Name = "prod-app-gw-${random_pet.end_string.id}"
  }

  tags = local.tags
}
