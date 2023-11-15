# Resource-1 create VPC
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name"  = "my-vpc"
  }
}

# Resource-2 Create public subnets
resource "aws_subnet" "my-vpc-public-subnet" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.1.0.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
}
# Resource-3 Create IGW
resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id
}

# Resource-4 Create Public Route table
resource "aws_route_table" "my-vpc-public-route-table" {
  vpc_id = aws_vpc.my-vpc.id
}

# Resource-5 Create Public Route
resource "aws_route" "my-vpc-public-route" {
  route_table_id = aws_route_table.my-vpc-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.my-igw.id
}
# Resource-6 Create Public Route Table Association
resource "aws_route_table_association" "my-route-associate" {
  route_table_id = aws_route_table.my-vpc-public-route-table.id
  subnet_id = aws_subnet.my-vpc-public-subnet.id
}
# Resource-7 Create Security Groups
resource "aws_security_group" "my-sg" {
  name  = "my-default-sg"
  description = "security group for my public subnet"
  vpc_id = aws_vpc.my-vpc.id

  ingress {
    description = "Allow all the traffic on port 22"
    from_port =  22
    to_port =  22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow all the traffic on port 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all the connection on outbound ports"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}