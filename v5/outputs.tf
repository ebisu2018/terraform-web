# output "count_all_arns" {
#   value = aws_iam_user.count-user[*].arn
# }

output "all_users" {
  value = aws_iam_user.for-each-user
}

output "value_all_arns" {
  value = values(aws_iam_user.for-each-user)[*].arn
}

output "short_upper_names" {
  value = [for name in var.user_names: upper(name) if length(name) < 5]
}

output "iter_name" {
  value = [for name in var.user_names: upper(name)]
}

output "iter_ai" {
  value = {for i, country in var.ai: upper(i) => upper(country)}
}