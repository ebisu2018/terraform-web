variable "server_port" {
  description = "Port of the server will use for internal request"
  type = number
  default = 8080
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
    Name = "terraform-web-cluster"
  }
}

variable "state_bucket" {
  type = string
  default = "terraform-state-bucket"
}

variable "dynamodb_table" {
  type = string
  default = "terraform-state-dynamodb-lock"
}


locals {
  any_ports = 0
  any_protocols = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}