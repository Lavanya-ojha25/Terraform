#Creating NSG with inbound and outbound rules
resource "azurerm_network_security_group" "nsg1" {
    name                = "nsg1"
    location            = var.location
    resource_group_name = var.azurerm_resource_group[count.index]

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    tags = var.Environment
}
