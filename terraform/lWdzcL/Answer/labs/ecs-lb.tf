module "alb" {
  source = "terraform-aws-modules/alb/aws"

  name               = "production-lb-${random_pet.end_string.id}"
  load_balancer_type = "application"
  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.private_subnets

  tags = {
    Environment = local.environment
    Project     = local.project
    Terraform   = "true"
  }
}
