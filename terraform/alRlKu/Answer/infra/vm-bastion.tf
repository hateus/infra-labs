module "ec2_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name                        = "labs-bastion-${random_pet.end_string.id}"
  instance_count              = 1
  ami                         = "ami-09e67e426f25ce0d7"
  instance_type               = "t3.micro"
  key_name                    = "administrator-key" # Import your key via Console AWS
  monitoring                  = true
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.bastion_sg.security_group_id]
  subnet_id                   = module.vpc.public_subnets[0]
}
