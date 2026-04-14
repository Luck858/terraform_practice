resource "aws_vpc" "my-vpc" {
  cidr_block = var.aws_vpc.cidr
  tags = {
    Name = var.aws_vpc.tag
  }

}

resource "aws_subnet" "subnet_one" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.subnet_one.cidr
  availability_zone       = var.subnet_one.az
  map_public_ip_on_launch = var.subnet_one.map_public_ip_on_launch
  tags = {
    Name = var.subnet_one.tag
  }
  depends_on = [
    aws_vpc.my-vpc
  ]
}

resource "aws_subnet" "subnet_two" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.subnet_two.cidr
  availability_zone = var.subnet_two.az
  tags = {
    Name = var.subnet_two.tag

  }
  depends_on = [
    aws_vpc.my-vpc,
    aws_subnet.subnet_one
  ]
}


resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "my-igw"
  }
  depends_on = [aws_vpc.my-vpc]
}

resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = var.pub-rt.tag
  }
  depends_on = [aws_subnet.subnet_one, aws_internet_gateway.my-igw]

}

resource "aws_route_table" "prt-rt" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = var.prt-rt.tag
  }
  depends_on = [aws_subnet.subnet_two]
}

resource "aws_route" "internet" {
  route_table_id         = aws_route_table.pub-rt.id
  gateway_id             = aws_internet_gateway.my-igw.id
  destination_cidr_block = var.route-int.dst-cidr-b
  depends_on             = [aws_internet_gateway.my-igw, aws_route_table.pub-rt]

}


resource "aws_route_table_association" "sub-ast-pub" {
  route_table_id = aws_route_table.pub-rt.id
  subnet_id      = aws_subnet.subnet_one.id

}


resource "aws_route_table_association" "sub-ast-prt" {
  route_table_id = aws_route_table.prt-rt.id
  subnet_id      = aws_subnet.subnet_two.id
}