resource "aws_security_group" "instance-sg" {
  name = "terraform-sg"
  ingress {
    from_port = local.any_ports
    to_port = local.any_ports
    protocol = local.any_protocols
    cidr_blocks = local.cidr_blocks
  }
  egress {
    from_port = local.any_ports
    to_port = local.any_ports
    protocol = local.any_protocols
    cidr_blocks = local.cidr_blocks
  }
}


resource "aws_security_group" "alb-sg" {
  name = "application-load-balancer-sg"
  ingress {
    from_port = var.alb_port
    to_port = var.alb_port
    protocol = "tcp"
    cidr_blocks = local.cidr_blocks
  }
  egress {
    from_port = local.any_ports
    to_port = local.any_ports
    protocol = local.any_protocols
    cidr_blocks = local.cidr_blocks
  }
}