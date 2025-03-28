resource "aws_security_group_rule" "allow_instance_inbound" {
  from_port         = local.any_port
  protocol          = local.any_protocol
  security_group_id = module.asg.instance_security_group_id
  to_port           = local.any_port
  type              = "ingress"
  cidr_blocks = local.all_ips
}

resource "aws_security_group_rule" "allow_instance_outbound" {
  from_port         = local.any_port
  protocol          = local.any_protocol
  security_group_id = module.asg.instance_security_group_id
  to_port           = local.any_port
  type              = "egress"
  cidr_blocks = local.all_ips
}


resource "aws_security_group_rule" "allow_http_inbound" {
  from_port         = local.any_port
  protocol          = local.any_protocol
  security_group_id = module.alb.alb_security_group_id
  to_port           = local.any_port
  cidr_blocks = local.all_ips
  type              = "ingress"
}


resource "aws_security_group_rule" "allow_all_outbound" {
  from_port         = local.any_port
  protocol          = local.any_protocol
  security_group_id = module.alb.alb_security_group_id
  to_port           = local.any_port
  type              = "egress"
  cidr_blocks = local.all_ips
}