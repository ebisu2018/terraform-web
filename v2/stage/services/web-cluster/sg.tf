resource "aws_security_group" "instance-sg" {
  name = "terraform-sg"
  ingress {
    from_port = var.server_port
    to_port = var.server_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "alb-sg" {
  name = "application-load-balancer-sg"
  ingress {
    from_port = var.alb_port
    to_port = var.alb_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}