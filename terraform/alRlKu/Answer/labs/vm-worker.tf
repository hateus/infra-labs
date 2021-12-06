module "worker-app-asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 4.0"

  # Autoscaling group
  name                        = "worker-app-asg-${random_pet.end_string.id}"
  min_size                    = 1
  max_size                    = 3
  desired_capacity            = 1
  wait_for_capacity_timeout   = 0
  health_check_type           = "EC2"
  associate_public_ip_address = false
  key_name                    = "internal-key"
  vpc_zone_identifier         = module.vpc.private_subnets

  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      min_healthy_percentage = 75
    }
    triggers = ["tag"]
  }

  # Launch template
  lt_name                = "worker-app-asg"
  description            = "Launch template to automate join docker swarm cluster"
  update_default_version = true
  use_lt                 = true
  create_lt              = true
  image_id               = "ami-09e67e426f25ce0d7"
  instance_type          = "t3.small"
  enable_monitoring      = true
  user_data              = file("./files/startup-join-cluster-app.sh")

  network_interfaces = [
    {
      delete_on_termination = true
      description           = "eth0"
      device_index          = 0
      security_groups       = module.manager_app_sg.security_group_id
    },
  ]

  placement = {
    availability_zone = "us-east-1a"
  }
}

module "worker-db-asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 4.0"

  # Autoscaling group
  name                        = "worker-db-asg-${random_pet.end_string.id}"
  min_size                    = 1
  max_size                    = 3
  desired_capacity            = 1
  wait_for_capacity_timeout   = 0
  health_check_type           = "EC2"
  associate_public_ip_address = false
  key_name                    = "internal-key"
  vpc_zone_identifier         = module.vpc.database_subnets

  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      min_healthy_percentage = 75
    }
    triggers = ["tag"]
  }

  # Launch template
  lt_name                = "worker-db-asg-${random_pet.end_string.id}"
  description            = "Launch template to automate join docker swarm cluster"
  update_default_version = true
  use_lt                 = true
  create_lt              = true
  image_id               = "ami-09e67e426f25ce0d7"
  instance_type          = "t3.small"
  enable_monitoring      = true
  user_data              = file("./files/startup-join-cluster-db.sh")

  network_interfaces = [
    {
      delete_on_termination = true
      description           = "eth0"
      device_index          = 0
      security_groups       = module.manager_db_sg.security_group_id
    },
  ]

  placement = {
    availability_zone = "us-east-1a"
  }
}
