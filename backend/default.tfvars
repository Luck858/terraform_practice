aws_region = "ap-south-1"

aws_vpc = {

  cidr = "192.168.0.0/16"
  tag  = "my-vpc"
}


public_subnet = [{
  cidr                    = "192.168.0.0/24"
  az                      = "ap-south-1a"
  tag                     = "pub-1"
  map_public_ip_on_launch = true


  }, {
  cidr                    = "192.168.1.0/24"
  az                      = "ap-south-1b"
  tag                     = "pub-2"
  map_public_ip_on_launch = true

  }
]

private_subnet = [{
  cidr                    = "192.168.2.0/24"
  az                      = "ap-south-1a"
  tag                     = "prt-1"
  map_public_ip_on_launch = false


  }, {
  cidr                    = "192.168.3.0/24"
  az                      = "ap-south-1b"
  tag                     = "prt-2"
  map_public_ip_on_launch = false

  }
]


security_group_info = {
  name = "my-sg"
  ingress_rule = [{
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr_ipv4   = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
  }]
  egress_rule = [{
    ip_protocol = "-1"
    cidr_ipv4   = "0.0.0.0/0"

  }]
}


aws_key_pair = {
  name     = "my-key"
  key_path = "~/.ssh/id_ed25519.pub"

}

aws_instance_info = {
  name          = "linux"
  instance_type = "t3.micro"

}

