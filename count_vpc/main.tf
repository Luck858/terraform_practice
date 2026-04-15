resource "aws_vpc" "my-vpc" {
  cidr_block = var.aws_vpc.cidr
  tags = {
    Name = var.aws_vpc.tag
  }

}

resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet)
  vpc_id            = aws_vpc.my-vpc.id
  availability_zone = var.public_subnet[count.index].az
  cidr_block        = var.public_subnet[count.index].cidr
  tags = {
    Name = var.public_subnet[count.index].tag
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet)
  vpc_id            = aws_vpc.my-vpc.id
  availability_zone = var.private_subnet[count.index].az
  cidr_block        = var.private_subnet[count.index].cidr
  tags = {
    Name = var.private_subnet[count.index].tag
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "public-rt"
  }

}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "private-rt"
  }

}


resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "my-igw"
  }

}
resource "aws_route" "internet" {
  route_table_id         = aws_route_table.public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my-igw.id

}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public-rt.id


}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private-rt.id


}


