# resource "aws_s3_bucket" "terraform_state_bucket" {
#   bucket = var.state_bucket
#   lifecycle {
#     prevent_destroy = true
#   }
# }
#
# resource "aws_s3_bucket_versioning" "versioning_bucket" {
#   bucket = aws_s3_bucket.terraform_state_bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }
#
# resource "aws_s3_bucket_server_side_encryption_configuration" "crypt" {
#   bucket = aws_s3_bucket.terraform_state_bucket.id
#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }