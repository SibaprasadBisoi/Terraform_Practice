# Input Variables
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "ap-south-1"
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-*********" # Amazon2 Linux AMI ID
  validation {
    condition = length(var.ec2_ami_id) > 4 && substr(var.ec2_ami_id, 0, 4) == "ami-"
    error_message = "The ec2 ami id must be valid AMI"
  }
}

variable "ec2_instance_count" {
  description = "EC2 Instance Count"
  type        = number
  default     = 1
}


variable "ec2_instance_type" {
  description = "type of ec2 instance"
  type = list(string)
  default = {
    small-apps  = "t2.micro"
    medium-apps = "t2.medium"
    large-apps  = "t2.large"
  }
}

variable "ec2_instance_tag" {
  description = "Tag of ec2 instance"
  type = map(string)
  default = {
    "Name"  = "ec2-instance"
    "Tier"  = "Web"
  }
}