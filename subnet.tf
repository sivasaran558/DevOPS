resource "aws_subnet" "public-subnets" {
  # Arguments
  #count = 3 
  count             = length(var.public_cidr_blocks)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.public_cidr_blocks, count.index)
  availability_zone = element(var.availability_zone, count.index)

  tags = {
    Name = "${var.vpc_name}-publicSubnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private-subnets" {
  # Arguments
  #count = 3 
  count             = length(var.private_cidr_blocks)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.private_cidr_blocks, count.index)
  availability_zone = element(var.availability_zone, count.index)

  tags = {
    Name = "${var.vpc_name}-privateSubnet-${count.index + 1}"
  }
}







