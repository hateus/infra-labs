terraform {
  backend "s3" {
    bucket  = "your-bucket-ini"
    key     = "labs-tfstate"
    encrypt = true
    region  = "us-east-1"
    profile = "labs"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.19"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "labs"
}
