# Input Variables
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}

variable "db_username" {
  description = "The username for database"
  type = string
  sensitive = true
}

variable "db_password" {
    description = "The password for database"
    type = string
    sensitive = true
  
}