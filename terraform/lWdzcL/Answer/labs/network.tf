module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  name               = "production-vpc-${random_pet.end_string.id}"
  cidr               = "192.168.20.0/23"
  azs                = ["us-east-1a", "us-east-1b"]
  private_subnets    = ["192.168.20.0/26", "192.168.20.64/26"]
  database_subnets   = ["192.168.20.128/26", "192.168.192/26"]
  public_subnets     = ["192.168.21.0/26", "192.168.21.64/26"]
  enable_nat_gateway = true
  single_nat_gateway = true

  igw_tags = {
    Name = "prod-app-gw-${random_pet.end_string.id}"
  }

  tags = {
    Environment = local.environment
    Project     = local.project
    Terraform   = "true"
  }
}
