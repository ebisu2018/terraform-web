provider "aws" {
  region = "ap-northeast-1"
  profile = "zayed"
}

module "web_cluster_stage" {
  source = "github.com/ebisu2018/terraform-up-running.git/web_cluster?ref=v1.0"

  cluster_name = "web-cluster-prod"
  db_remote_state_bucket = var.remote_state_bucket
  db_remote_state_key = "prod/data-stores/mysql/terraform.tfstate"
  ami_id = "ami-06c6f3fa7959e5fdd"
  instance_type = "m4.large"
  min_size = 2
  max_size = 10
  desired = 2
  user_data_script = "${path.module}/user-data.sh"
  enable_autoscaling = true
}