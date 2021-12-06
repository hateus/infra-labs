module "manager_app_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name                = "allow-app-service-${random_pet.end_string.id}"
  description         = "Security group for user-service with custom ports open within VPC, and SSH, HTTPS, HTTP publicly open"
  vpc_id              = module.vpc.vpc_cidr_block
  ingress_cidr_blocks = module.vpc.vpc_cidr_block
  ingress_rules       = ["ssh-tcp", "https-443-tcp", "http-80-tcp", "docker-swarm-mngmt-tcp", "docker-swarm-node-tcp", "docker-swarm-node-udp", "docker-swarm-overlay-udp"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
  tags                = local.tags
}

module "manager_db_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name                = "allow-db-service-${random_pet.end_string.id}"
  description         = "Security group for db-service with custom ports open within VPC, and PostgreSQL, MySQL publicly open"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = module.vpc.vpc_cidr_block
  ingress_rules       = ["ssh-tcp", "mysql-tcp", "postgresql-tcp", "docker-swarm-mngmt-tcp", "docker-swarm-node-tcp", "docker-swarm-node-udp", "docker-swarm-overlay-udp"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
  tags                = local.tags
}
