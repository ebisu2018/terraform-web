variable "server_port" {
  description = "Port of the server will use for internal request"
  type = number
  default = 80
}

variable "alb_port" {
  description = "Port of the alb will use for HTTP request"
  type = number
  default = 80
}

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
    Name = "terraform-single-web-server"
  }
}


locals {
  any_ports = 0
  any_protocols = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}