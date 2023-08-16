#Create the resource group
resource "azurerm_resource_group" "KPA-Belfast23-connor-rg" {
  name     = "KPA-Belfast23-connor-rg"
  location = "eastus"
}

# The linux app service plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "App_Service_Plan"
  location            = azurerm_resource_group.KPA-Belfast23-connor-rg.location
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  sku_name            = "B1"
  os_type             = "Linux"


}

# The web app
resource "azurerm_linux_web_app" "webapp" {
  name                = "connor-web-application"
  location            = azurerm_resource_group.KPA-Belfast23-connor-rg.location
  resource_group_name = azurerm_resource_group.KPA-Belfast23-connor-rg.name
  service_plan_id     = azurerm_service_plan.appserviceplan.id
  https_only          = true

  site_config {
    minimum_tls_version = "1.2"
  }


}
