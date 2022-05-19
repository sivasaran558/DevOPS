resource "aws_vpc" "default" {
  #cidr_block = "10.66.0.0/16"
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = var.vpc_name
    Owner       = var.vpc_owner
    environment = var.environment
  }

}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }

}