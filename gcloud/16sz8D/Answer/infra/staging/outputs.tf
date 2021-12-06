output "subnetid_list" {
  description = "ID of All Subnets"
  value       = module.vpc.subnets_ids
}

output "subnet_list" {
  description = "Detail of All Subnets"
  value       = module.vpc.subnets
}

output "subnet_region" {
  description = "Region of Subnets"
  value       = module.vpc.subnets_regions
}
