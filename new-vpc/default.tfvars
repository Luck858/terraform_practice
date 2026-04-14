aws_region = "ap-south-1"

aws_vpc = {
  cidr = "192.168.0.0/16"
  tag  = "my-vpc"
}


subnet_one = {
  cidr                    = "192.168.0.0/24"
  az                      = "ap-south-1a"
  tag                     = "subnet_one"
  map_public_ip_on_launch = true
}

subnet_two = {
  cidr = "192.168.1.0/24"
  az   = "ap-south-1b"
  tag  = "subnet_two"
}


pub-rt = {
  tag = "pub-rt"
}

prt-rt = {
  tag = "prt-rt"
}

route-int = {
  dst-cidr-b = "0.0.0.0/0"
}
