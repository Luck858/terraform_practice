resource_group = {
  name     = "my-rg"
  location = "centralindia"
}
vnet = {
  name          = "my-vnet"
  address_space = ["192.168.0.0/16"]
}

subnets = [
  {
    address_prefixes = ["192.168.0.0/24"]
    name             = "web"
    public_subnets   = true
  },
  {
    address_prefixes = ["192.168.1.0/24"]
    name             = "app"
    public_subnets   = false
  },
  {
    address_prefixes = ["192.168.2.0/24"]
    name             = "db"
    public_subnets   = false
  }
]