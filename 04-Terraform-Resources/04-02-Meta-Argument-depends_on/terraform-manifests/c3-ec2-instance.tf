# Create resource for ec2 instance
resource "aws_instance" "my-ec2" {
  ami =  "am-***********"
  instance_type = "t2.micro"
  key_name = "terraform.key"
  subnet_id = aws_subnet.my-vpc-public-subnet.id
  security_groups = [aws_security_group.my-sg.id]
  user_data = file(script.sh)
  tags = {
    "Name"  = "my-ec2"
  }
}