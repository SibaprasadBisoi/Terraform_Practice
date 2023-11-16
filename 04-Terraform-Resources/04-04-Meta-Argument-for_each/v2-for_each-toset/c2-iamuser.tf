# Resource to create iam users
resource "aws_iam_user" "myuser" {
  for_each = toset(["joe", "honey", "wed"])
  name = each.key
}