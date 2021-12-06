locals {
  environment = "prod"
  project     = "exploration"
}

resource "random_pet" "end_string" {
  separator = "-"
}
