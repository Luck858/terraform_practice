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
  name                = var.security_group.name
  resource_group_name = azurerm_resource_group.my-rg.name
  location            = azurerm_resource_group.my-rg.location

}
resource "azurerm_network_security_rule" "rules" {
  count                       = length(var.security_rule)
  name                        = var.security_rule[count.index].name
  priority                    = var.security_rule[count.index].priority
  direction                   = var.security_rule[count.index].direction
  access                      = var.security_rule[count.index].access
  protocol                    = var.security_rule[count.index].protocol
  source_port_range           = var.security_rule[count.index].source_port_range
  destination_port_range      = var.security_rule[count.index].destination_port_range
  source_address_prefix       = var.security_rule[count.index].source_address_prefix
  destination_address_prefix  = var.security_rule[count.index].destination_address_prefix
  resource_group_name         = azurerm_resource_group.my-rg.name
  network_security_group_name = azurerm_network_security_group.web-nsg.name
}

resource "azurerm_network_interface" "net-interface" {
  name                = var.network_interface.name
  resource_group_name = azurerm_resource_group.my-rg.name
  location            = azurerm_resource_group.my-rg.location
  ip_configuration {
    name                          = var.network_interface.ip_configuration_name
    subnet_id                     = azurerm_subnet.subnets[0].id
    private_ip_address_allocation = var.network_interface.private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.public-ip.id
  }

}

resource "azurerm_network_interface_security_group_association" "web" {

  network_interface_id      = azurerm_network_interface.net-interface.id
  network_security_group_id = azurerm_network_security_group.web-nsg.id
}