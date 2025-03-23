variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_tags" {
  type = map(string)
}

variable "cluster_name" {
  type = string
}

variable "db_remote_state_bucket" {
  type = string
}

variable "db_remote_state_key" {
  type = string
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "desired" {
  type = number
}

variable "user_data" {
  type = string
}

locals {
  http_port = 80
  any_port = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  all_ips = ["0.0.0.0/0"]
}