variable "state_bucket" {
  type = string
  description = "The name of the S3 bucket. Must be globally unique."
  default = "terraform-state-bucket"
}

variable "dynamodb_table" {
  type = string
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  default = "terraform-state-bucket-locks"
}