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