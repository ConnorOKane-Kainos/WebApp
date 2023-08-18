# This resource defines a virtual network in Azure, essentially the backbone for all the subnets that will be created.
resource "azurerm_virtual_network" "KPA-Belfast23-connor-vnet" {
  name                = "KPA-Belfast23-connor-vnet"
  location            = azurerm_resource_group.KPA-Belfast23-connor-rg.location
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    enviroment = "ConnorOK-tag"
  }

}

# This resource creates a subnet specifically for a web application.
#This subnet has delegations to Microsoft's web server farms, allowing it to host services like Azure App Service.
resource "azurerm_subnet" "webapp-subnet" {
  name                 = "web-app-subnet-connor"
  resource_group_name  = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  virtual_network_name = azurerm_virtual_network.KPA-Belfast23-connor-vnet.name
  address_prefixes     = ["10.0.1.0/24"]

# The delegation section grants permissions for the web services to operate within this subnet.
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


# This subnet is designed to use Azure's Service Endpoints. Service Endpoints allow services within Azure to directly connect to the subnet.
#Bypassing the need to expose the service to the public internet.
resource "azurerm_subnet" "keyvault-subnet" {
  name                 = "service-endpoint-connor"
  resource_group_name  = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  virtual_network_name = azurerm_virtual_network.KPA-Belfast23-connor-vnet.name
  address_prefixes     = ["10.0.3.0/24"]

}

# This subnet is purposed for Azure's Private Endpoints.
#Private Endpoints allow a specific Azure service (like Azure Database) to be accessed within the subnet, but not be exposed to the broader internet.
resource "azurerm_subnet" "db-subnet" {
  name                 = "private-endpoint-connor"
  resource_group_name  = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  virtual_network_name = azurerm_virtual_network.KPA-Belfast23-connor-vnet.name
  address_prefixes     = ["10.0.2.0/24"]


}

# This subnet is purposed for Azure's Private Endpoints.
#Private Endpoints allow a specific Azure service (like Azure Database) to be accessed within the subnet, but not be exposed to the broader internet.
resource "azurerm_subnet" "vm-subnet" {
  name                 = "vm-for-db-subnet"
  resource_group_name  = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  virtual_network_name = azurerm_virtual_network.KPA-Belfast23-connor-vnet.name
  address_prefixes     = ["10.0.4.0/24"]
}

# A subnet dedicated to Azure Bastion.
#Azure Bastion provides secure and seamless RDP/SSH connectivity to virtual machines directly from the Azure portal.

resource "azurerm_subnet" "AzureBastionSubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  virtual_network_name = azurerm_virtual_network.KPA-Belfast23-connor-vnet.name
  address_prefixes     = ["10.0.5.0/24"]
}

