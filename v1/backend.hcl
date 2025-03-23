# terraform init -backend-config=backend.hcl
bucket = "terraform-state-bucket"
region = "ap-northeast-1"
dynamodb_table = "terraform-state-bucket-lock"
encrypt = true