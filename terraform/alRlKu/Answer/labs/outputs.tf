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

output "manager_app_sg" {
  description = "Security Group ID of Manager APP"
  value       = module.manager_app_sg.security_group_id
}

output "manager_db_sg" {
  description = "Security Group ID of Manager Database"
  value       = module.manager_db_sg.security_group_id
}

output "worker_sg" {
  description = "Security Group ID of Worker"
  value       = module.worker_sg.security_group_id
}
