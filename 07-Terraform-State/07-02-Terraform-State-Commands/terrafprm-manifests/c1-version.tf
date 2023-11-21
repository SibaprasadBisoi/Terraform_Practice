# Terraform Block
terraform {
  required_version = "~>1.4.7"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.16.1"
    }
  } 
  # Adding backend as S3 for remote storage
  backend "s3" {
    bucket = "mys3bucket"
    key = "dev/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "My-dynamodb-table"
  }
}

# Provider Block
provider "aws" {
  region = var.aws_region
  profile = "default"
}