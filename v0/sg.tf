resource "aws_security_group" "instance-sg" {
  name = "terraform-sg"
  ingress {
    from_port = local.ingress_port
    to_port = local.egress_port
    protocol = local.tcp_protocol
    cidr_blocks = local.cidr_blocks
  }
  egress {
    from_port = local.any_port
    to_port = local.any_port
    protocol = local.any_protocol
    cidr_blocks = local.cidr_blocks
  }
}