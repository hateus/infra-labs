module "service_app" {
  source = "telia-oss/ecs-fargate/aws"

  name_prefix          = "service-app"
  container_name       = "service-app-${random_pet.end_string.id}"
  vpc_id               = module.vpc.vpc_id
  private_subnet_ids   = module.vpc.private_subnets
  lb_arn               = module.alb.lb_arn
  cluster_id           = module.ecs_cluster.arn
  task_container_image = "${var.APP_REGISTRY}:latest"
  desired_count        = 1
  task_container_port  = 4000

  task_container_environment = {
    REDIS_ENDPOINT_URL = module.redis-cache.endpoint
    REDIS_PASSWORD     = ""
  }

  health_check = {
    port = "4000"
    path = "/"
  }

  tags = {
    Environment = local.environment
    Project     = local.project
    Terraform   = "true"
  }
}
