resource "aws_route_table" "terraform-public" {
  vpc_id = aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }
  tags = {
    Name = "${var.vpc_name}-public-RT"
  }
}


resource "aws_route_table" "terraform-private" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.vpc_name}-private-RT"
  }
}

resource "aws_route_table_association" "terraform-public" {
  count = 3
  #count = length(var.public_cidr_blocks)  - This will dynamically calculate the lenghth of private-subnets and repeat this block those many tmes
  subnet_id      = element(aws_subnet.public-subnets.*.id, count.index)
  route_table_id = aws_route_table.terraform-public.id

}

resource "aws_route_table_association" "terraform-private" {
  count          = 3
  subnet_id      = element(aws_subnet.private-subnets.*.id, count.index)
  route_table_id = aws_route_table.terraform-private.id

}