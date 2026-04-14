aws_region = "ap-south-1"

aws_vpc = {

  cidr = "192.168.0.0/16"
  tag  = "my-vpc"
}


subnets = [{
  cidr = "192.168.0.0/24"
  az   = "ap-south-1a"
  tag  = "subnet_one"


  }, {
  cidr = "192.168.1.0/24"
  az   = "ap-south-1b"
  tag  = "subnet_two"

  }
]


