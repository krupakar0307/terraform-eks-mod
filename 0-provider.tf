provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.31.0"
    }
  }
}