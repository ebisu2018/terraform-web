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

  backend "s3" {
    key = "prod/data-stores/mysql/terraform.tfstate"
  }
}

module "db_prod" {
  source = "../../../modules/data-stores/mysql"

  db_instance-class = "db.t2.micro"
  db_name = "rds-mysql-prod"
  username = "admin"
  secret_id = "mysql-password-prod"
}