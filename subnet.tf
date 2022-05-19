resource "aws_subnet" "subnet1-public" {
  # Arguments
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "${aws_vpc.default.id}-public-subnet-1"
  }
}

resource "aws_subnet" "subnet2-public" {
  # Arguments
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = "${aws_vpc.default.id}-public-subnet-2"
  }
}

resource "aws_subnet" "subnet3-public" {
  # Arguments
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet3_cidr
  availability_zone = "us-east-1c"

  tags = {
    Name = "${aws_vpc.default.id}-public-subnet-3"
  }

}