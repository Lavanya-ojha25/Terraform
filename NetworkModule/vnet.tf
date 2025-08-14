resource "azurerm_resource_group" "rg" {
    count    = 2
    name     = "${var.azurerm_resource_group}${count.index}"
    location = var.location
}

resource "azurerm_virtual_network" "vnet" {
    depends_on          = [ azurerm_resource_group.rg ]
    count               = 2
    name                = "${var.virtual_network}${count.index}"
    resource_group_name = azurerm_resource_group.rg.name[count.index]
    location            = azurerm_resource_group.existing-rg.location
    address_space       = [var.address_space]
}

resource "azurerm_subnet" "subnet" {
    count                = length(var.subnet)
    resource_group_name  = data.azurerm_resource_group.existing-rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    name                 = var.subnet[count.index]
    address_prefixes     = [ var.address_prefix[count.index] ]
}

