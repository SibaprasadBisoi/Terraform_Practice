# Create Elastic IP
resource "aws_eip" "my-ip" {
  instance = aws_instance.my-ec2.id
  vpc = true
  depends_on = [ aws_internet_gateway.my-igw ]
}