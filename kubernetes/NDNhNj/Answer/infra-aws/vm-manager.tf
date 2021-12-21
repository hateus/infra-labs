# ###########################################################
# # WARNING: Uncomment this file, if you have create an SSH
# # key from bastion machine
# ###########################################################

module "ec2_app_manager" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.3.0"


  name                        = "manager-app-${random_pet.end_string.id}"
  ami                         = "ami-04505e74c0741db8d"
  instance_type               = "t3.small"
  key_name                    = "from-bastion-key" # Manually create SSH key from your bastion
  monitoring                  = true
  associate_public_ip_address = false
  vpc_security_group_ids      = [module.microservice_app_sg.security_group_id]
  subnet_id                   = module.vpc.private_subnets[0]
  user_data                   = file("./files/startup-manager.sh")
  disable_api_termination     = true
}
