# Create S3 bucket with Input variables
locals {
  bucket-name = "${var.app_name}-${var.environment_name}-bucket"
}

resource "aws_s3_bucket" "mys3bucket" {
  bucket = local.bucket-name
  acl = "private"
  tags = {
    "Name" = local.bucket-name
    "environment" = var.environment_name
  }
}