resource "aws_s3_bucket" "mybucket1" {
  bucket = "${lower(var.vpc_name)}-bucket1"

  tags = {
    Name        = "${lower(var.vpc_name)}-bucket1"
    Environment = var.environment

  }

  depends_on = [
    aws_vpc.default
  ]
}

resource "aws_s3_bucket" "mybucket2" {
  bucket = "${lower(var.vpc_name)}-bucket2"

  tags = {
    Name        = "${lower(var.vpc_name)}-bucket2"
    Environment = var.environment

  }

  depends_on = [
    aws_vpc.default, aws_s3_bucket.mybucket1

  ]
}


resource "aws_s3_bucket" "mybucket3" {
  bucket = "${lower(var.vpc_name)}-bucket3"

  tags = {
    Name        = "${lower(var.vpc_name)}-bucket3"
    Environment = var.environment

  }

  depends_on = [
    aws_vpc.default, aws_s3_bucket.mybucket2

  ]
}
