
output "rg-name" {
  value = azurerm_resource_group.my-rg.name
}
output "vnet-name" {
  value = azurerm_virtual_network.my-vnet.name

}

output "subnets" {
  value = azurerm_subnet.subnets[*].name
}

output "public-ip" {
  value = azurerm_public_ip.public-ip.ip_address
}

output "vm_username" {
  value = azurerm_linux_virtual_machine.linux.admin_username
}
