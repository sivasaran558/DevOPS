resource "random_integer" "priority" {
  count = 3
  min   = 1
  max   = 150

}

resource "aws_s3_bucket" "devopsb25functions" {
  count  = 3
  bucket = format("devopsb25functions%s", element(random_integer.priority.*.result, count.index))

  tags = {
    Name        = format("devopsb25functions%s", element(random_integer.priority.*.result, count.index))
    Environment = var.environment
  }

}