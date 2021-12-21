module "ecs_cluster" {
  source = "github.com/jetbrains-infra/terraform-aws-ecs-cluster?ref=v0.5.2"

  cluster_name        = "production-cluster-${random_pet.end_string.id}"
  target_capacity     = 100
  trusted_cidr_blocks = [module.vpc.vpc_cidr_block]
  subnets_ids         = module.vpc.private_subnets

  instance_types = {
    "t3.small" = 3
  }

  ebs_disks = {
    "/dev/sda" = 30
  }
}
