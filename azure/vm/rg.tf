resource "azurerm_resource_group" "my-rg" {
  name     = var.resource_group.name
  location = var.resource_group.location

}