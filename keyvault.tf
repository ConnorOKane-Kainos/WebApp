data "azurerm_client_config" "connor" {}

# Retrieves Azure client configuration details and creates a standard Key Vault in the specified resource group.


resource "azurerm_key_vault" "keyvault-subnet" {
  name                       = "keyvault-subnet"
  location                   = azurerm_resource_group.KPA-Belfast23-connor-rg.location
  resource_group_name        = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  tenant_id                  = data.azurerm_client_config.connor.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7
  purge_protection_enabled   = false

}
