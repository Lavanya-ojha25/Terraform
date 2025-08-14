#Retrieving resource group name created earlier
data "azurerm_resource_group" "existing-rg" {
    name = var.azurerm_resource_group
}
