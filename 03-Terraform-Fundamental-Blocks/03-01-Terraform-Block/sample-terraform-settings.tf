# Terraform Block
terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.16.1"
    }
    random = {
        source = "hashicorp/aws"
        version = "~>3.0.1"
    }
    null = {
        source = "hashicorp/null"
        version = "~>3.0.0"
    }
    time = {
        source = "hashicorp/time"
        version = "~>0.6.0"
    }
  }
}