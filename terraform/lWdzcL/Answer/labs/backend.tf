terraform {
  backend "s3" {
    bucket  = "thisis-state"
    key     = "labs-tfstate"
    encrypt = true
    region  = "us-east-1"
    profile = "labs"
  }

  required_providers {
    aws = {
      version = "~> 3.19"
    }

    random = {
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  profile = "labs"
  region  = var.aws_region
}
