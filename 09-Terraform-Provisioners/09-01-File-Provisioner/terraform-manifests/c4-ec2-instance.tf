# Create EC2 instance resource
resource "aws_instance" "myec2" {
  ami = "ami-**************"
  instance_type = var.instance_type
  key_name = "terraform.key"
  user_data = file("apache-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "vm-${terraform.workspace}-0"
  }
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("private-key/terrafrom-key.pem")
  }
  provisioner "file" {
    source = "apps/file-copy.html"
    destination = "/tmp/file-copy.html"
  }
  provisioner "file" {
    content = "ami used: ${self.ami}"
    destination = "/tmp/file.log"
  }
  provisioner "file" {
    source = "apps/app1"
    destination = "/tmp"
  }
  provisioner "file" {
    source = "apps/app2"
    destination = "/tmp"
  }
}