module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.11.0"


  name                = "labs-vpc-${random_pet.end_string.id}"
  cidr                = "172.17.0.0/16"
  azs                 = ["us-east-1a", "us-east-1b"]
  private_subnets     = ["172.17.1.0/24", "172.17.2.0/24"]
  elasticache_subnets = ["172.17.3.0/24", "172.17.4.0/24"]
  public_subnets      = ["172.17.5.0/24", "172.17.6.0/24"]
  enable_nat_gateway  = true
  single_nat_gateway  = true

  igw_tags = {
    Name = "labs-app-gw-${random_pet.end_string.id}"
  }
}
