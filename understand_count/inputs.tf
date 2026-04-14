variable "vpcs" {
  type = list(object({
    cidr_block = string
    Name = string
  }))

  default = [
    {
      cidr_block = "192.168.0.0/16"
      Name = "vpc-1"
    },
    {
      cidr_block = "192.168.0.0/16"
      Name = "vpc-2"
    },
    {
      cidr_block = "192.168.0.0/16"
      Name = "vpc-3"
    }
  ]
}
