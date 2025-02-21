# 使用count后得到的是资源的数组
resource "aws_iam_user" "demo-user" {
  count = length(var.user_names)
  name = var.user_names[count.index]
}

