output "vpc" {
  description = "ID of Production Cluster VPC"
  value       = module.vpc.vpc_id
}

output "private_subnets_list" {
  description = "List of private_subnets_list"
  value       = module.vpc.private_subnets
}

output "public_subnets_list" {
  description = "List of public_subnets_list"
  value       = module.vpc.public_subnets
}

output "service_app_sg" {
  description = "Security Group ID of App Zone"
  value       = module.service_app_sg.security_group_id
}

output "service_redis_sg" {
  description = "Security Group ID of Database Zone"
  value       = module.service_redis_sg.security_group_id
}

output "target_group_app" {
  description = "Target Group ID of App Zone"
  value       = module.service_app.target_group_arn
}
