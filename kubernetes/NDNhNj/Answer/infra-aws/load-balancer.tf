module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "labs-alb-${random_pet.end_string.id}"

  load_balancer_type = "application"
  vpc_id             = module.vpc.vpc_id
  subnets            = slice(module.vpc.public_subnets, 0, 2)
  security_groups    = [module.alb_sg.security_group_id]

  target_groups = [
    {
      name_prefix      = "labs-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = [
        {
          target_id = module.ec2_app_manager.id
          port      = 80
        }
      ]
    },
  ]

  http_tcp_listeners = [
    {
      port     = 80
      protocol = "HTTP"
    }
  ]

  http_tcp_listener_rules = [
    {
      http_tcp_listener_index = 0
      priority                = 5000

      actions = [
        {
          type               = "forward"
          target_group_index = 0
        }
      ]

      conditions = [
        {
          host_headers = ["microservices-gw.test.id"]
        }
      ]
    }
  ]
}
