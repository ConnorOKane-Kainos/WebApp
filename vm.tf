resource "azurerm_network_interface" "vm_nic_connor" {
  name                = "vm-nic-connor"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name


  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "Connor-Real-VM" {
  name                = "Connor-Real-VM"
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  location            = "eastus"
  size                = "Standard_B2ms"
  admin_username      = "azureuser"
  admin_password      = "LiverPool123"
  network_interface_ids = [
  azurerm_network_interface.vm_nic_connor.id]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}


