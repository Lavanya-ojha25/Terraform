resource "azurerm_public_ip" "winvm-ip" {
  count               = 2
  name                = "winip${count.index}"
  location            = data.azurerm_resource_group.existing-rg.location
  resource_group_name = data.azurerm_resource_group.existing-rg.name
  allocation_method   = "Dynamic"
  tags = var.Environment
}

resource "azurerm_public_ip" "linvm-ip" {
  count               = 2
  name                = "linip${count.index}"
  location            = data.azurerm_resource_group.existing-rg.location
  resource_group_name = data.azurerm_resource_group.existing-rg.name
  allocation_method   = "Dynamic"
  tags = var.Environment
}