#Creating the DB and refrencing the server the DB will connect to

resource "azurerm_postgresql_database" "connor-postgres-sql-db" {
  name                = "connor-postgres-sql-db"
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  server_name         = azurerm_postgresql_server.KPA-Belfast23-connor-sql.name
  charset             = "UTF8"
  collation           ="English_United States.1252"
}