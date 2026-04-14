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


variable "subnet_one" {
  type = object({
    cidr                    = string
    az                      = string
    tag                     = string
    map_public_ip_on_launch = bool
  })
  default = {
    cidr                    = "192.168.0.0/24"
    az                      = "ap-south-1a"
    tag                     = "subnet_one"
    map_public_ip_on_launch = true
  }
}

variable "subnet_two" {
  type = object({
    cidr = string
    az   = string
    tag  = string
  })
  default = {
    cidr = "192.168.1.0/24"
    az   = "ap-south-1b"
    tag  = "subnet_two"
  }
}




variable "pub-rt" {
  type = object({
    tag = string
  })
  default = {
    tag = "pub-rt"
  }

}

variable "prt-rt" {
  type = object({
    tag = string
  })
  default = {
    tag = "prt-rt"
  }
}




variable "route-int" {
  type = object({
    dst-cidr-b = string
  })
  default = {
    dst-cidr-b = "0.0.0.0/0"
  }

}



















