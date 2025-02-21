variable "server_port" {
  description = "Port of the server will use for internal request"
  type = number
}

variable "alb_port" {
  description = "Port of the alb will use for HTTP request"
  type = number
}

variable "instance_type" {
  type = string
}

variable "instance_tags" {
  type = map(string)
  default = {
    Name = "terraform-web-cluster"
  }
}

variable "remote_state_bucket" {
  type = string
  default = "terraform-state-bucket-a7cac924"
}