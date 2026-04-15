variable "aws_region" {
  type        = string
  default     = "ap-south-1"
  description = "provider-region"
}

variable "aws_vpc" {
  type = object({
    cidr = string
    tag  = string
  })
  default = {
    cidr = "192.168.0.0/16"
    tag  = "my-vpc"
  }
}

variable "public_subnet" {
  type = list(object({
    cidr = string
    az   = string
    tag  = string
  }))

  default = [
    {
      cidr = "192.168.0.0/24"
      az   = "ap-south-1a"
      tag  = "pub-1"
    },
    {
      cidr = "192.168.1.0/24"
      az   = "ap-south-1b"
      tag  = "pub-2"
    }
  ]
}


variable "private_subnet" {
  type = list(object({
    cidr = string
    az   = string
    tag  = string
  }))

  default = [
    {
      cidr = "192.168.2.0/24"
      az   = "ap-south-1a"
      tag  = "prt-1"
    },
    {
      cidr = "192.168.3.0/24"
      az   = "ap-south-1b"
      tag  = "prt-2"
    }
  ]
}


