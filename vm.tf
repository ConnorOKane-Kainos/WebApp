# This resource block defines a network interface (NIC) in Azure for virtual machines.
#resource "azurerm_network_interface" "vm_nic_connor"

  
resource "azurerm_network_interface" "vm_nic_connor" {
  name                = "vm-nic-connor"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name

# The ip_configuration block within it details how the NIC should be set up with respect to IP addresses.
  #ip_configuration
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# This resource block defines a Windows virtual machine (VM) in Azure.
#resource "azurerm_windows_virtual_machine" "Connor-Real-VM"
resource "azurerm_windows_virtual_machine" "Connor-Real-VM" {
  name                = "Connor-Real-VM"
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  location            = "eastus"
  size                = "Standard_B2ms"
  admin_username      = "azureuser"
  admin_password      = "LiverPool123"
  network_interface_ids = [
  azurerm_network_interface.vm_nic_connor.id]


# This resource block defines a Windows virtual machine (VM) in Azure.
#resource "azurerm_windows_virtual_machine" "Connor-Real-VM"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # The source_image_reference block specifies the base image used for the VM. In this case, it's a Windows Server 2019 Datacenter edition.
  #source_image_reference
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}


                                        ##############SUMMARY###################
#A network interface named "vm-nic-connor" is created in the "eastus" region, associated with a specific subnet and configured for dynamic private IP allocation.
#A Windows virtual machine named "Connor-Real-VM" is provisioned in the "eastus" region. It uses the above NIC for networking.
#The VM is based on the Windows Server 2019 Datacenter image and has specific disk configurations.
