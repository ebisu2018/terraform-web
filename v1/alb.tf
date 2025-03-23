resource "aws_lb" "front-alb" {
  name = "terraform-web-alb"
  load_balancer_type = "application"
  subnets = data.aws_subnets.default.ids
  security_groups = [aws_security_group.alb-sg.id]
}


resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.front-alb.arn
  port = var.alb_port
  protocol = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: Page not found"
      status_code  = "404"
    }
  }
}


# 监听server的端口，因为httpd默认80端口，因此监听80，除非AMI中修改conf文件监听其他端口
resource "aws_lb_target_group" "asg-tg" {
  name = "terraform-demo-lb-alb-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = data.aws_vpc.default.id

  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200"
    interval = 15
    timeout = 3
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}


resource "aws_lb_listener_rule" "alb-rule" {
  listener_arn = aws_lb_listener.http.arn
  priority = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.asg-tg.arn
  }
}