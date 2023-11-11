# Resource vpc in ap-east-1
resource "aws_vpc" "vpc-ap-east-1" {
  cidr_block = "10.1.0.0/16"
  provider = aws.aws-east-1
  tags = {
    "Name" = "vpc-ap-east-1"
  }
}