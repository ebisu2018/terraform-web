provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.86.1"
    }
  }

#   backend "s3" {
#     key = "stage/data-stores/mysql/terraform.tfstate"
#   }
}

module "db_stage" {
  source = "github.com/ebisu2018/terraform-up-running.git/db_stores?ref=v0.0.1"

  db_instance-class = "db.t2.micro"
  db_name = "rds-mysql-stage"
  username = "admin"
  secret_id = "mysql-password-stage"
}