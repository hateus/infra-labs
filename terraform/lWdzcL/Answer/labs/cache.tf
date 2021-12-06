resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "redis-cluster-${random_pet.end_string.id}"
  engine               = "redis"
  engine_version       = "6.x"
  node_type            = "cache.t3.small"
  num_cache_nodes      = 1
  subnet_group_name    = module.vpc.private_subnets
  security_group_ids   = [module.service_redis_sg.id]
  parameter_group_name = "default.redis6.x"

  tags = {
    Environment = local.environment
    Project     = local.project
    Terraform   = "true"
  }
}
