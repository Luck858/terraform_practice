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

security_group = {
  name = "my-sg"
}

security_rule = [
  {
    name                       = "openhttp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "openssh"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "openhttps"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
]



network_interface = {
  name                          = "net-interface"
  ip_configuration_name         = "ip_net-interface"
  private_ip_address_allocation = "Dynamic"
}


azure_vm = {
  name                            = "linux-vm"
  size                            = "Standard_E2s_v3"
  admin_username                  = "Dell"
  disable_password_authentication = true

  ssh_key_username = "Dell"
  ssh_key_path     = "C:/Users/neela/.ssh/id_ed25519.pub"

  source_image_reference = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}