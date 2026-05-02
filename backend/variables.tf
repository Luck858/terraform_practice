variable "aws_region" {
  type = string
}

variable "aws_vpc" {
  type = object({
    cidr = string
    tag  = string
  })

}


variable "public_subnet" {
  type = list(object({
    cidr                    = string
    az                      = string
    tag                     = string
    map_public_ip_on_launch = bool
  }))


}


variable "private_subnet" {
  type = list(object({
    cidr                    = string
    az                      = string
    tag                     = string
    map_public_ip_on_launch = bool
  }))


}


variable "security_group_info" {
  type = object({
    name = string
    ingress_rule = list(object({
      from_port   = number
      to_port     = number
      ip_protocol = string
      cidr_ipv4   = string
    }))
    egress_rule = list(object({
      ip_protocol = string
      cidr_ipv4   = string
    }))
  })

}


variable "aws_key_pair" {
  type = object({
    name     = string
    key_path = optional(string, "~/.ssh/id_ed25519.pub")
  })

}


variable "aws_instance_info" {
  type = object({
    name          = string
    instance_type = string
    username      = optional(string, "ubuntu")

  })

}

