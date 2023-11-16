# Resource create s3 buckets with for each
resource "aws_s3_bucket" "mys3bucket" {
    for_each = {
        dev = "my-dev-bucket"
        qa  = "my-qa-bucket"
        stag = "my-stag-bucket"
        prod = "my-prod-bucket"
    }
    bucket = "${each.key}-${each.value}"
    acl = "private"
    tags = {
      environment  = each.key
      bucketname    = "${each.key}-${each.value}"
      value = each.value
    }

}

