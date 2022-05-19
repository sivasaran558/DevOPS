provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token      = var.aws_session_token
  region     = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "tfstate-tmp-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "devops-terraform-state-lock-dynamo"
    encrypt        = true
  }
}