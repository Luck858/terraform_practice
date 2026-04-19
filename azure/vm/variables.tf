variable "resource_group" {
  type = object({
    name     = string
    location = string
  })

}

variable "vnet" {
  type = object({
    name          = string
    address_space = list(string)

  })
}

variable "subnets" {
  type = list(object({
    name             = string
    address_prefixes = list(string)
    public_subnets   = bool

  }))

}