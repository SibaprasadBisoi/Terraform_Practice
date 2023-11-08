# Terraform Block
terraform {
  required_version = "~>1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.16.1"
    }
  }
  backend "s3" {
    bucket         = "myfirstbucket"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "my-dynamodb-table"
  }
}

# Provider Block
provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-02e94b011299ef128"
  instance_type = var.instance_type
}

# Input Variable
variable "instance_type" {
  description = "Type of ec2 instance"
  type        = string
  default     = "t2.micro"
}

# Output Variable
output "ec2_instance_publicip" {
  description = "Public ip of ec2 instance"
  value       = aws_instance.ec2demo.public_ip
}

# Local values block
locals {
  bucket-name-prefix = ${var.app_name}-${var.environment_name}
}

# Data Source block

data "aws_ami" "amzlinux" {
  most_recent = true
  ownners     = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-hvm-ami-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = [x86_64]
  }
}

# Modules block
module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"
  name                   = "my-ec2-module"
  instance_count         = 2
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  key_name               = "terraform-key"
  monitoring             = true
  vpc_security_group_ids = ["sgr-0cc65292eba4fee1"]
  user_data              = file(install_nginx.sh)
  tags = {
    terraform   = "true"
    Environment = "dev"
  }
}