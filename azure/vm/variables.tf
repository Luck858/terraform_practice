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
variable "security_group" {
  type = object({
    name = string

  })
}


variable "security_rule" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))

}


variable "network_interface" {
  type = object({
    name                          = string
    ip_configuration_name         = string
    private_ip_address_allocation = string
  })

}


variable "azure_vm" {
  type = object({
    name                            = string
    size                            = string
    admin_username                  = string
    disable_password_authentication = bool
    ssh_key_username                = string
    ssh_key_path                    = string
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    os_disk = object({
      caching              = string
      storage_account_type = string
    })


  })

}


