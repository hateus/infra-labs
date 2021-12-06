module "service_app_sg" {
  source = "terraform-aws-modules/security-group/aws"

  description         = "Security group for user-service with custom ports open within VPC, HTTP publicly open"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = module.vpc.private_subnets

  ingress_with_cidr_blocks = [
    {
      from_port   = 4000
      to_port     = 4000
      protocol    = "tcp"
      description = "Chat App Service"
      cidr_blocks = "192.168.20.0/24"
    }
  ]
}

module "service_redis_sg" {
  source = "terraform-aws-modules/security-group/aws"

  description         = "Security group for Redis service with custom ports open within VPC"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = module.vpc.vpc_cidr_block
  ingress_rules       = ["redis-tcp"]
}
