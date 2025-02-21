# 必须先部署好s3才可以配置后端
terraform {
  backend "s3" {
    key = "global/s3/terraform.tfstate"
  }
}