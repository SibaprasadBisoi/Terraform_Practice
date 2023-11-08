# Terraform Block
terraform {
  required_version = "~>1.0.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.16.1"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  profile = "default"
}

# Resource Block
resource "aws_instance" "practice-vm" {
  ami = "ami-02e94b011299ef128"
  instance_type = "t2.micro"
}