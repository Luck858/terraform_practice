
output "rg-name" {
  value = azurerm_resource_group.my-rg.name
}
output "vnet-name" {
  value = azurerm_virtual_network.my-vnet.name

}

output "subnets" {
  value = azurerm_subnet.subnets[*].name
}

output "subnet_prefixes" {
    value = azurerm_subnet.subnets[*].address_prefixes
}
