# terraform init -backend-config=backend.hcl
bucket = "terraform-state-bucket-a7cac924"
region = "ap-northeast-1"
dynamodb_table = "terraform-state-bucket-locks"
encrypt = true
profile = "zayed"