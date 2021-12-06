module "ec2_app_manager" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name                        = "manager-app-${random_pet.end_string.id}"
  instance_count              = 1
  ami                         = "ami-09e67e426f25ce0d7"
  instance_type               = "t2.micro"
  key_name                    = "internal-key"
  monitoring                  = true
  associate_public_ip_address = true
  private_ip                  = "10.20.20.1"
  vpc_security_group_ids      = [module.manager_app_sg.security_group_id]
  subnet_id                   = module.vpc.private_subnets
  user_data                   = file("./files/startup-manager.sh")
  tags                        = local.tags
}

module "ec2_db_manager" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name                   = "manager-db-${random_pet.end_string.id}"
  instance_count         = 1
  ami                    = "ami-09e67e426f25ce0d7"
  instance_type          = "t2.micro"
  key_name               = "internal-key"
  monitoring             = true
  private_ip             = "10.20.20.126"
  vpc_security_group_ids = [module.manager_db_sg.security_group_id]
  subnet_id              = module.vpc.database_subnets
  user_data              = file("./files/startup-manager.sh")
  tags                   = local.tags
}
