resource "azurerm_windows_virtual_machine" "vmwin" {
  count               = 2
  name                = "${var.windowvm}${count.index}"
  resource_group_name = data.azurerm_resource_group.existing-rg.name
  location            = data.azurerm_resource_group.existing-rg.location
  size                = "Standard_B1s"
  admin_username      = var.windows_cred["admin_username"]
  admin_password      = var.windows_cred["admin_password"]
  network_interface_ids = [
    azurerm_network_interface.nic1[count.index].id,
  ]

  os_disk {
    caching              = var.win_os_disk["caching"]
    storage_account_type = var.win_os_disk["storage_account_type"]
  }

  source_image_reference {
    publisher = var.win_source_image_reference["publisher"]
    offer     = var.win_source_image_reference["offer"]
    sku       = var.win_source_image_reference["sku"]
    version   = var.win_source_image_reference["version"]
  }
  tags = var.Environment
}

resource "azurerm_linux_virtual_machine" "vmlin" {
  count                           = 2
  name                            = "${var.linuxvm}${count.index}"
  resource_group_name             = data.azurerm_resource_group.existing-rg.name
  location                        = data.azurerm_resource_group.existing-rg.location
  size                            = "Standard_B2s"
  disable_password_authentication = false
  admin_username                  = var.linux_cred["admin_username"]
  admin_password                  = var.linux_cred["admin_password"]
  network_interface_ids = [
    azurerm_network_interface.nic2[count.index].id,
  ]

  os_disk {
    caching              = var.lin_os_disk["caching"]
    storage_account_type = var.lin_os_disk["storage_account_type"]
  }

  source_image_reference {
    publisher = var.lin_source_image_reference["publisher"]
    offer     = var.lin_source_image_reference["offer"]
    sku       = var.lin_source_image_reference["sku"]
    version   = var.lin_source_image_reference["version"]
  }
  tags = var.Environment
}