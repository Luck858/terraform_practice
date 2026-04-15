aws_region = "ap-south-1"

aws_vpc = {

  cidr = "192.168.0.0/16"
  tag  = "my-vpc"
}


public_subnet = [{
  cidr = "192.168.0.0/24"
  az   = "ap-south-1a"
  tag  = "pub-1"


  }, {
  cidr = "192.168.1.0/24"
  az   = "ap-south-1b"
  tag  = "pub-2"

  }
]

private_subnet = [{
  cidr = "192.168.0.0/24"
  az   = "ap-south-1a"
  tag  = "prt-1"


  }, {
  cidr = "192.168.1.0/24"
  az   = "ap-south-1b"
  tag  = "prt-2"

  }
]


