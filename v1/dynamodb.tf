# resource "aws_dynamodb_table" "state_lock" {
#   name = var.dynamodb_table
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key = "LockId"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }