resource "aws_vpc" "my-vpc" {
  cidr_block = var.aws_vpc.cidr
  tags = {
    Name = var.aws_vpc.tag
  }

}

resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnet)
  vpc_id                  = aws_vpc.my-vpc.id
  availability_zone       = var.public_subnet[count.index].az
  cidr_block              = var.public_subnet[count.index].cidr
  map_public_ip_on_launch = var.public_subnet[count.index].map_public_ip_on_launch
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

resource "aws_security_group" "my-sg" {
  name   = var.security_group_info.name
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = var.security_group_info.name
  }
}



resource "aws_vpc_security_group_ingress_rule" "sg-rules" {
  count             = length(var.security_group_info.ingress_rule)
  security_group_id = aws_security_group.my-sg.id
  from_port         = var.security_group_info.ingress_rule[count.index].from_port
  to_port           = var.security_group_info.ingress_rule[count.index].to_port
  ip_protocol       = var.security_group_info.ingress_rule[count.index].ip_protocol
  cidr_ipv4         = var.security_group_info.ingress_rule[count.index].cidr_ipv4

}

resource "aws_vpc_security_group_egress_rule" "outbound" {
  count             = length(var.security_group_info.egress_rule)
  security_group_id = aws_security_group.my-sg.id
  ip_protocol       = var.security_group_info.egress_rule[count.index].ip_protocol
  cidr_ipv4         = var.security_group_info.egress_rule[count.index].cidr_ipv4

}




