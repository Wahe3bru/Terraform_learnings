variable "bucket_name" {
  description = "The name of s3 bucket for tfstate"
  type        = string
  default     = "terraform_learning_state"
}

variable "table_name" {
  description = "The name of DynamoDB table, for locking"
  type        = string
  default     = "terraform-learning-locks"
}
