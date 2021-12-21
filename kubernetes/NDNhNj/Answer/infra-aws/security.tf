module "bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.7.0"

  name                = "allow-bastion-service-${random_pet.end_string.id}"
  description         = "Guardian of bastion-service"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
}

module "alb_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.7.0"

  name                = "allow-lb-service-${random_pet.end_string.id}"
  description         = "Guardian of lb-service"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["https-443-tcp", "http-80-tcp"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
}

module "microservice_app_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.7.0"

  name                = "allow-app-service-${random_pet.end_string.id}"
  description         = "Guardian of micro-service application"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "https-443-tcp", "kubernetes-api-tcp"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
}
