# 创建一个instance
# resource "aws_instance" "demo-server" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [aws_security_group.instance-sg.id]
#   user_data     = <<-EOF
# #! /bin/bash
# echo "Hello World" > index.html
# nohup busybox httpd -f -p ${var.server_port}&
# EOF
#   tags = var.instance_tags
# }