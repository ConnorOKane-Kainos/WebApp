# Sets up a private endpoint named "connor-PrivateEndPoint" in the "eastus" region and associated with the specified resource group.
# This endpoint targets the PostgreSQL server, creating a secure and direct connection within the "db-subnet".
# The connection, named "connor-privatesecureconnection", ensures that the PostgreSQL server is accessed privately within the virtual network, 
# eliminating exposure to the public internet.

resource "azurerm_private_endpoint" "connor-PrivateEndPoint" {
  name                = "connor-PrivateEndPoint"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  subnet_id           = azurerm_subnet.db-subnet.id

  private_service_connection {
    name                           = "connor-privatesecureconnection"
    private_connection_resource_id = azurerm_postgresql_server.KPA-Belfast23-connor-sql.id
    subresource_names              = ["postgresqlServer"]
    is_manual_connection           = false
  }
}
