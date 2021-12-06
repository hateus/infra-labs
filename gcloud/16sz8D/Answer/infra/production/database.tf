resource "google_redis_instance" "redis" {
  name               = "private-redis-prod"
  tier               = "STANDARD_HA"
  memory_size_gb     = 2
  location_id        = var.region
  authorized_network = module.vpc.subnets.ids[0]
  reserved_ip_range  = "10.10.2.0/24"
  connect_mode       = "PRIVATE_SERVICE_ACCESS"
  redis_version      = "REDIS_6_x"
  display_name       = "Production Redis Instance"
}

##
# Please contribute if you have a way to install mongodb through terraform
##
