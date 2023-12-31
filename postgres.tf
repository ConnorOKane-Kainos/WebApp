# Creates an Azure PostgreSQL server with specified configurations, storage, backup, and security settings in the designated resource group.

resource "azurerm_postgresql_server" "KPA-Belfast23-connor-sql" {
  name                = "connor-psqlserver"
  location            = azurerm_resource_group.KPA-Belfast23-connor-rg.location
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name

  administrator_login          = "psqladmin"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "GP_Gen5_4"
  version    = "11"
  storage_mb = 640000

  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"

}