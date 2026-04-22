
resource "azurerm_linux_virtual_machine" "linux" {
  name                = var.azure_vm.name
  location            = azurerm_resource_group.my-rg.location
  resource_group_name = azurerm_resource_group.my-rg.name

  network_interface_ids = [
    azurerm_network_interface.net-interface.id
  ]

  size = var.azure_vm.size

  admin_username = var.azure_vm.admin_username
  admin_ssh_key {
    username   = var.azure_vm.ssh_key_username
    public_key = file(var.azure_vm.ssh_key_path)

  }

  disable_password_authentication = var.azure_vm.disable_password_authentication


  source_image_reference {

    publisher = var.azure_vm.source_image_reference.publisher
    offer     = var.azure_vm.source_image_reference.offer
    sku       = var.azure_vm.source_image_reference.sku
    version   = var.azure_vm.source_image_reference.version
  }

  os_disk {
    caching              = var.azure_vm.os_disk.caching
    storage_account_type = var.azure_vm.os_disk.storage_account_type
  }
}

