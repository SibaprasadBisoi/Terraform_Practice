# Define output variables
output "arn" {
  description = "Arn of the s3 bucket"
  value = aws_s3_bucket.s3_bucket.arn
}
output "name" {
  description = "Name of the bucket"
  value = aws_s3_bucket.s3_bucket.id
}
output "domain" {
  description = "Domain of the bucket"
  value = aws_s3_bucket.s3_bucket.website_domain
}
output "endpoint" {
  description = "Endpoint of the bucket"
  value = aws_s3_bucket.s3_bucket.website_endpoint
}