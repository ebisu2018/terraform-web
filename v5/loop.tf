# 使用count后得到的是资源的数组
# resource "aws_iam_user" "count-user" {
#   count = length(var.user_names)
#   name = var.user_names[count.index]
# }


# for each支持集合映射，不支持列表，需要用toset转换
# 使用each.key或each.value
resource "aws_iam_user" "for-each-user" {
  for_each = toset(var.user_names) #变成了映射
  name = each.value
}
