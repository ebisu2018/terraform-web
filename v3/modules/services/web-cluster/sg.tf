resource "aws_security_group" "instance-sg" {
  name = "${var.cluster_name}-instance-sg"
}


resource "aws_security_group_rule" "instance_inbound_rule" {
  from_port         = local.any_port
  protocol          = local.any_protocol
  security_group_id = aws_security_group.instance-sg.id
  to_port           = local.any_port
  type              = "ingress"
}

resource "aws_security_group_rule" "instance_outbound_rule" {
  from_port         = local.any_port
  protocol          = local.any_protocol
  security_group_id = aws_security_group.instance-sg.id
  to_port           = local.any_port
  type              = "egress"
}


resource "aws_security_group" "alb-sg" {
  name = "${var.cluster_name}-alb-sg"
}


resource "aws_security_group_rule" "allow_http_inbound" {
  from_port         = local.http_port
  protocol          = local.tcp_protocol
  security_group_id = aws_security_group.alb-sg.id
  to_port           = local.http_port
  cidr_blocks = local.all_ips
  type              = "ingress"
}


resource "aws_security_group_rule" "allow_all_outbound" {
  from_port         = local.any_port
  protocol          = local.any_protocol
  security_group_id = aws_security_group.alb-sg.id
  to_port           = local.any_port
  type              = "egress"
  cidr_blocks = local.all_ips
}