resource "azurerm_virtual_network" "my-vnet" {
  resource_group_name = azurerm_resource_group.my-rg.name
  location            = azurerm_resource_group.my-rg.location
  address_space       = var.vnet.address_space
  name                = var.vnet.name

}

resource "azurerm_subnet" "subnets" {

  count = length(var.subnets)

  virtual_network_name            = azurerm_virtual_network.my-vnet.name
  resource_group_name             = azurerm_resource_group.my-rg.name
  name                            = var.subnets[count.index].name
  address_prefixes                = var.subnets[count.index].address_prefixes
  default_outbound_access_enabled = var.subnets[count.index].public_subnets

}

resource "azurerm_public_ip" "public-ip" {
  name                = "public-ip"
  resource_group_name = azurerm_resource_group.my-rg.name
  location            = azurerm_resource_group.my-rg.location
  allocation_method   = "Static"

}

resource "azurerm_network_security_group" "web-nsg" {
  name                = "web-nsg"
  resource_group_name = azurerm_resource_group.my-rg.name
  location            = azurerm_resource_group.my-rg.location
  security_rule {
    name                       = "openssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "openhttp"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "net-interface" {
  name                = "net-interface"
  resource_group_name = azurerm_resource_group.my-rg.name
  location            = azurerm_resource_group.my-rg.location
  ip_configuration {
    name                          = "web-net-interface"
    subnet_id                     = azurerm_subnet.subnets[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public-ip.id
  }

}

resource "azurerm_network_interface_security_group_association" "web" {

  network_interface_id      = azurerm_network_interface.net-interface.id
  network_security_group_id = azurerm_network_security_group.web-nsg.id
}