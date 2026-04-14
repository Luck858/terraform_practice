resource "aws_vpc" "my-vpc" {
  cidr_block = var.aws_vpc.cidr
  tags = {
    Name = var.aws_vpc.tag
  }

}

resource "aws_subnet" "subnets" {
  count             = length(var.subnets)
  vpc_id            = aws_vpc.my-vpc.id
  availability_zone = var.subnets[count.index].az
  cidr_block        = var.subnets[count.index].cidr
  tags = {
    Name = var.subnets[count.index].tag
  }
}


