resource "azurerm_public_ip" "connor-real-vm-ip-pub" {
  name                = "connor-real-vm-ip-pub"
  location            = azurerm_resource_group.KPA-Belfast23-connor-rg.location
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "connor-bastion" {
  name                = "eonnor-bastion"
  location            = azurerm_resource_group.KPA-Belfast23-connor-rg.location
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.AzureBastionSubnet.id
    public_ip_address_id = azurerm_public_ip.connor-real-vm-ip-pub.id
  }
}