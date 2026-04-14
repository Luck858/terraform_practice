terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.39.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "vpc-0116" {
  cidr_block = "192.168.0.0/24"
  tags = {
    name = "abc"
  }
}