#Private EndPoint
resource "azurerm_private_endpoint" "ConnorOKane-PrivateEndPoint" {
  name                = "connor-PrivateEndPoint"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  subnet_id           = azurerm_subnet.db-subnet.id

private_service_connection {
  name = "connor-privatesecureconnection"
  private_connection_resource_id = azurerm_postgresql_server.KPA23-Belfast23-connor-sql.id
  subresource_names = ["postgresqlServer"]
  is_manual_connection = false
}
}
