#Declaration of Variable types
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
    default = "vnet1"
}

variable "subnet" {
    type    = list(string)
    default = [
        "sub1", "sub2"
    ]
}

variable "address_space" {
    type    = string
    default = "10.0.0.0/16"
}

variable "address_prefix" {
    type    = list(string)
    default = [ "10.0.0.0/24", "10.0.1.0/24" ]
}

variable "Environment" {
    type    = map(string)
    default = {
      "Environment" = "Testing"
    }
}
