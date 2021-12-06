variable "path_cred" {
  description = "Staging path credential project GCP"
  type        = string

  default = "key/tf-key.json"
}

variable "project_id" {
  description = "ID Project GCP"
  type        = string
}

variable "region" {
  description = "Region Project GCP"
  type        = string

  default = "us-east1"
}

# Make sure you have connected to the relevant repository

variable "github_owner" {
  description = "Owner Project Github"
  type        = string
}

variable "github_repository" {
  description = "Repository Name Project Github"
  type        = string
}
