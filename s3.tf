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

