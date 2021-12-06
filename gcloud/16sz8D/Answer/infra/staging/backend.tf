terraform {
  backend "gcs" {
    bucket      = "thisis-state"
    prefix      = "terraform/staging"
    credentials = "key/tf-key.json"
  }
}

provider "google" {
  version     = "~> 3.66"
  credentials = file(var.path_cred)
  project     = var.project_id
  region      = var.region
}
