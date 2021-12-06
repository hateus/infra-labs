resource "google_redis_instance" "redis" {
  name               = "private-redis-stag"
  tier               = "STANDARD_HA"
  memory_size_gb     = 1
  location_id        = var.region
  authorized_network = module.vpc.subnets.ids[0]
  reserved_ip_range  = "20.20.2.0/24"
  connect_mode       = "PRIVATE_SERVICE_ACCESS"
  redis_version      = "REDIS_6_x"
  display_name       = "Staging Redis Instance"
}

##
# Please contribute if you have a way to install mongodb through terraform
##
