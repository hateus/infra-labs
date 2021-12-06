module "vpc" {
  source = "terraform-google-modules/network/google"

  project_id   = var.project_id
  network_name = "production-vpc"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "application-production"
      subnet_ip     = "10.10.1.0/24"
      subnet_region = var.region
      description   = "Application Subnet"
    }, 
    {
      subnet_name   = "database-production"
      subnet_ip     = "10.10.2.0/24"
      subnet_region = var.region
      descritpion   = "Database Subnet"
    }, 
  ]
}
