# Terraform Block
terraform {
  required_version = "~>1.4.7"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.16.1"
    }
  }
}
# Provider BLock
provider "aws" {
  region = "ap-south-1"
  profile = "default"
}