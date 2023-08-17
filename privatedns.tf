resource "azurerm_private_dns_zone" "connor-dns-zone" {
  name                = "connor-web-application.azurewebsites.net"
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "connor-dns-links" {
  name                  = "connor-dns-links"
  resource_group_name   = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  private_dns_zone_name = azurerm_private_dns_zone.connor-dns-zone.name
  virtual_network_id    = azurerm_virtual_network.KPA-Belfast23-connor-vnet.id
}