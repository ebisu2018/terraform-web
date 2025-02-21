resource "aws_launch_template" "instance-tpl" {
  image_id = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.instance-sg.id]
  user_data = base64encode(<<-EOF
#! /bin/bash
echo "Hello World" > index.html
nohup busybox httpd -f -p ${var.server_port}&
EOF
  )
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_group" "asg-demo" {
  min_size = 1
  max_size = 2
  desired_capacity = 1
  target_group_arns = [aws_lb_target_group.asg-tg.arn]
  health_check_type = "ELB"

  vpc_zone_identifier = data.aws_subnets.default.ids
  launch_template {
    id = aws_launch_template.instance-tpl.id
  }
}
