module "vpc" {
  source = "terraform-google-modules/network/google"

  project_id   = var.project_id
  network_name = "staging-vpc"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "application-staging"
      subnet_ip     = "20.20.1.0/24"
      subnet_region = var.region
      description   = "Application Subnet"
    },
    {
      subnet_name   = "database-staging"
      subnet_ip     = "20.20.2.0/24"
      subnet_region = var.region
      description   = "Database Subnet"
    },
  ]
}
