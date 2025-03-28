module "asg" {
  source = "git@github.com:ebisu2018/terraform-up-running.git/v2/cluster/asg-rolling-deploy"

  cluster_name = "asg-${var.environment}"
  ami = var.ami
  instance_type = var.instance_type

  min_size = var.min_size
  max_size = var.max_size
  enable_autoscaling = var.enable_autoscaling

  subnet_ids = data.aws_subnets.default.ids

}

module "alb" {
  source = "git@github.com:ebisu2018/terraform-up-running.git/v2/networking/alb"

  alb_name = "alb-${var.environment}"
  subnet_ids = data.aws_subnets.default.ids
}


resource "aws_lb_target_group" "asg-tg" {
  name = "${var.environment}-tg"
  port = local.http_port
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
  listener_arn = module.alb.alb_http_listener_arn
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