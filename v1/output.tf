output "alb_dns" {
  value = aws_lb.front-alb.dns_name
}

# subnets = tolist([
#   "subnet-08058823c682911ca",
#   "subnet-0e0ae1ad2f51d73c5",
#   "subnet-07b4a128068f8edea",
# ])
output "subnets" {
  value = data.aws_subnets.default.ids
}

# output "s3_bucket_arn" {
#   value = aws_s3_bucket.terraform_state_bucket.arn
# }
#
# output "dynamodb_table_name" {
#   value = aws_dynamodb_table.state_lock.name
# }