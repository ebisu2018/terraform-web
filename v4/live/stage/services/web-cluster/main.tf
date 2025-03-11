provider "aws" {
  region = "ap-northeast-1"
  profile = "zayed"
}

module "web_cluster_stage" {
  source = "github.com/ebisu2018/terraform-up-running.git/web_cluster?ref=v1.0"

  cluster_name = "web-cluster-stage"
  ami_id = "ami-06c6f3fa7959e5fdd"
  instance_type = "t2.micro"
  min_size = 1
  max_size = 3
  desired = 2
  user_data_script = "${path.module}/user-data.sh"
  enable_autoscaling = false
}


# 自定义sg规则，更灵活
resource "aws_security_group_rule" "allow_testing-inbound" {
  from_port         = 12345
  protocol          = "tcp"
  security_group_id = module.web_cluster_stage.alb_security_group_id
  to_port           = 12345
  type              = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}