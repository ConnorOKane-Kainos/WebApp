resource "azurerm_network_interface" "vm_nic_connor" {
  name = "vm-nic-connor"
  location = "eastus"
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name


ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.vm-subnet.id
    private_ip_address = "Dyanmic"
}
}

resource "azurerm_linux_virtual_machine" "Connor-Real-VM" {
  name = "Connor-Real-VM"
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  location = "eastus"
  size = "Standard_B2ms"
  admin_username = "azureuser"
  admin_password = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.vm_nic_connor
  ]
}