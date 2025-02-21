data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    region = "ap-northeast-1"
    bucket = "terraform-state-bucket"
    key = "stage/data-stores/mysql/terraform.tfstate"
  }
}

data "template_file" "user-data" {
  template = file("user-data.sh")
  vars = {
    server_port = var.server_port
    db_address = data.terraform_remote_state.db.outputs.address
    db_port = data.terraform_remote_state.db.outputs.port
  }
}