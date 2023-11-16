# Create resource for ec2 instance
resource "aws_instance" "my-ec2" {
  ami = "ami-****************"
  instance_type = "t2.micro"
  count = 5
  user_data = file(script.sh)
  tags = {
    "Name"  = "my-ec2"
  }
}