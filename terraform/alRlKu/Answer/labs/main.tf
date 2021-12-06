locals {
  tags = {
    Environment = "prod"
    Project     = "exploration"
    Terraform   = "true"
  }
}

resource "random_pet" "end_string" {
  separator = "-"
}
