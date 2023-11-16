# Resource create ec2 instance
resource "aws_instance" "myec2" {
  ami = "ami-***************"
  instance_type = "t2.micro"
  count = 5
  tags = {
    "Name" = "myec2"
  }
  lifecycle {
    ignore_changes = [  ] 
  }
}