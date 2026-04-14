# -------------------
# Create VPC
# -------------------
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "tf-vpc"
    Env  = "dev"
  }
}

# -------------------
# Create Subnet
# -------------------
resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.subnet_az


  tags = {
    Name = "tf-subnet"
    Env  = "dev"
  }
}
