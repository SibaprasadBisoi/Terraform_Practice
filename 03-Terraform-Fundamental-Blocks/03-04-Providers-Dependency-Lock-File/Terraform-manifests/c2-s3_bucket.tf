resource "random_pet" "pet-name" {
  length = 5
  separator = "-"
}

resource "aws_s3_bucket" "mybucket" {
  bucket = random_pet.pet-name
  acl = "public-red"
  region = "ap-south-1"
}