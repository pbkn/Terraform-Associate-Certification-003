output "lb" {
  value = aws_eip.lb
}

output "bucket_1" {
  value = aws_s3_bucket.bucket_1.bucket_domain_name
}

output "timeout" {
  value = local.time
}