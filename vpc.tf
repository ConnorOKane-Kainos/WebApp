#Creating Private EndPoint
resource "azurerm_virtual_network" "KPA-Belfast23-connor-vnet" {
  name                = "KPA-Belfast23-connor-vnet"
  location            = azurerm_resource_group.KPA-Belfast23-connor-rg.location
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    enviroment = "ConnorOK-tag"
  }

}

#Subnet for WebApp
resource "azurerm_subnet" "webapp-subnet" {
  name                 = "web-app-subnet-connor"
  resource_group_name  = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  virtual_network_name = azurerm_virtual_network.KPA-Belfast23-connor-vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
      name = "Microsoft.Web/serverFarms"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/read",
        "Microsoft.Network/virtualNetworks/subnets/action"
      ]
    }
  }
}


#Subnet for Service Endpoint
resource "azurerm_subnet" "keyvault-subnet" {
  name                 = "service-endpoint-connor"
  resource_group_name  = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  virtual_network_name = azurerm_virtual_network.KPA-Belfast23-connor-vnet.name
  address_prefixes     = ["10.0.3.0/24"]

}

#Subnet for Private Endpoint
resource "azurerm_subnet" "db-subnet" {
  name                 = "private-endpoint-connor"
  resource_group_name  = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  virtual_network_name = azurerm_virtual_network.KPA-Belfast23-connor-vnet.name
  address_prefixes     = ["10.0.2.0/24"]


}

#Subnet for VM
resource "azurerm_subnet" "vm-subnet" {
  name                 = "vm-for-db-subnet"
  resource_group_name  = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  virtual_network_name = azurerm_virtual_network.KPA-Belfast23-connor-vnet.name
  address_prefixes     = ["10.0.4.0/24"]
}

#Subnet For Bastian

resource "azurerm_subnet" "AzureBastionSubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  virtual_network_name = azurerm_virtual_network.KPA-Belfast23-connor-vnet.name
  address_prefixes     = ["10.0.5.0/24"]
}

