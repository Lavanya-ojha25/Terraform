# Attaching NIC on top of VM
resource "azurerm_network_interface" "nic1" {
  count               = 2
  name                = "win-nic${count.index}"
  location            = data.azurerm_resource_group.existing-rg.location
  resource_group_name = data.azurerm_resource_group.existing-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id[0]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.winvm-ip[count.index].id
  }
  tags = var.Environment
}

resource "azurerm_network_interface" "nic2" {
  count               = 2
  name                = "lin-nic${count.index}"
  location            = data.azurerm_resource_group.existing-rg.location
  resource_group_name = data.azurerm_resource_group.existing-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id[1]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linvm-ip[count.index].id
  }

  tags = var.Environment
}
