# Resource for ec2 insatance
resource "aws_insstance" "my-ec2" {
  ami = "ami-02e94b011299ef128"
  instance_type = "t3.medium"
  availability_zone = "ap-south-1a"
  tags = {
    "Name" = "Web"
  }
}