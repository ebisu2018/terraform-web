# 必须先部署好s3才可以配置后端
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.86.1"
    }
  }

  backend "s3" {
    key = "prod/terraform.tfstate"
  }
}