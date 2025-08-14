variable "azurerm_resource_group" {
    type    = string  
    default = "rg-test"
}

variable "windowvm" {
    type    = string
    default = "winvm"
}

variable "linuxvm" {
    type    = string
    default = "linvm"
}

variable "subnet_id" {
    type = list(string)
    default = [""]
}

variable "windows_cred" {
    type    = map(string)
    default = {
      admin_username      = "adminuser"
      admin_password      = "Shivoy@123"
    }
}

variable "linux_cred" {
    type    = map(string)
    default = {
      admin_username      = "adminuser"
      admin_password      = "Shivoy@123"
    }
}

variable "win_source_image_reference" {
    type    = map(string)
    default = {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2016-Datacenter"
        version   = "latest"
    }
}
variable "win_os_disk" {
    type    = map(string)
    default = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
}

variable "lin_source_image_reference" {
    type    = map(string)
    default = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts-gen2"
        version   = "latest"
    }
}
variable "lin_os_disk" {
    type    = map(string)
    default = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
}

variable "Environment" {
    type    = map(string)
    default = {
      "Environment" = "Testing"
    }
}