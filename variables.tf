variable "subscription_id" {
    type    = string
    default = "40d1d403-e9ac-4afe-97ee-caad6e58f8fc"
}

variable "azurerm_resource_group" {
    type    = string  
    default = "rg"
}

variable "location" {
    type    = string
    default = "Central India"  
}

variable "virtual_network" {
    type    = string
    default = "vnet"
}

variable "subnet" {
    type    = string
    default = "sub"
}

variable "address_space" {
    type    = list(string)
    default = [ "10.0.0.0/16", "10.1.0.0/16" ]
}

variable "address_prefix" {
    type    = list(string)
    default = [ "10.0.0.0/24", "10.1.0.0/24" ]
}

variable "windowvm" {
    type    = string
    default = "winvm"
}

variable "linuxvm" {
    type    = string
    default = "linvm"
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