resource "azurerm_linux_virtual_machine" "linux" {
  name                = "linux-vm"
  location            = azurerm_resource_group.my-rg.location
  resource_group_name = azurerm_resource_group.my-rg.name

  network_interface_ids = [
    azurerm_network_interface.net-interface.id
  ]

  size = "Standard_E2s_v3"

  admin_username = "Dell"
  admin_ssh_key {
    username   = "Dell"
    public_key = file("~/.ssh/id_ed25519.pub")

  }

  disable_password_authentication = true

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

