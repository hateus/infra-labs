variable "APP_REGISTRY" {
  description = "ECR URL to pull application container image"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string

  default = "us-east-1"
}