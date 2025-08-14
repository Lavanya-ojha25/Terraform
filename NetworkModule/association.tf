#Associate NSG On top of Subnet
resource "azurerm_subnet_network_security_group_association" "nsg_sub1" {
    count                     = length(var.subnet)
    subnet_id                 = azurerm_subnet.subnet[count.index].id
    network_security_group_id = azurerm_network_security_group.nsg1.id
}
