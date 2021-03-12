output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value = aws_s3_bucket.terraform_state.arn
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  value = aws_dynamodb_table.terraform_locks.name
}
