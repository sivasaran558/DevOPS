provider "aws" {
  #access_key = var.aws_access_key
  #secret_key = var.aws_secret_key
  #token      = var.aws_session_token
  region = var.aws_region
}

terraform {
  required_version = "1.1.7"
  required_providers {
    aws = {
      version = "<= 5.0.0"
      source  = "hashicorp/aws"

    }
  }
  backend "s3" {
    bucket = "tfstate-tmp-state"
    key    = "functions.tfstate"
    region = "us-east-1"
  }
}
