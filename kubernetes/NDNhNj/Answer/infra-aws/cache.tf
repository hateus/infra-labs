# ###########################################################
# # WARNING: Uncomment this file, if you want to use managed
# # redis
# ###########################################################

# module "redis-cache" {
#   source  = "cloudposse/elasticache-redis/aws"
#   version = "0.41.2"

#   name  = "cache"
#   stage = "labs"

#   vpc_id                           = module.vpc.vpc_id
#   subnets                          = slice(module.vpc.private_subnets, 0, 2)
#   instance_type                    = "cache.t3.micro"
#   cluster_size                     = 2
#   apply_immediately                = true
#   automatic_failover_enabled       = true
#   multi_az_enabled                 = true
#   engine_version                   = "6.x"
#   family                           = "redis6.x"
#   at_rest_encryption_enabled       = false
#   transit_encryption_enabled       = false
#   cloudwatch_metric_alarms_enabled = false
#   create_security_group            = true
# }
