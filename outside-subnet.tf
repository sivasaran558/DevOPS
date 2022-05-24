data "aws_vpc" "siva-perftests-VpcStack-IOKMSZMLBVRY-VPC" {
  #id = "provide_existing_VPC_ID"
  id = "vpc-075c19474dda98341"

}

resource "aws_subnet" "addedtf" {
  vpc_id            = data.aws_vpc.siva-perftests-VpcStack-IOKMSZMLBVRY-VPC.id
  cidr_block        = "10.0.0.0/26"
  availability_zone = "us-east-1a"

  tags = {
    Name = "addedtf"
  }
}




