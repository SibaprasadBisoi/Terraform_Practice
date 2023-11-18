# Resource for RDS
resource "aws_db_instance" "db1" {
  allocated_storage = 5
  engine = "mysql"
  instance_class = "db.t2.micro"
  name = "my-db"
  username = var.db_username
  password = var.db_password
  skip_final_snapshot = true
}