variable "ami_id" {
  type = string
  default = "ami-06c6f3fa7959e5fdd"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_tags" {
  type = map(string)
  default = {
    Name = "terraform-http"
  }
}

locals {
  ingress_port = 80
  egress_port = 80
  any_port = 0
  tcp_protocol = "tcp"
  any_protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}