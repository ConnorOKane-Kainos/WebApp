# Outputs the name of the specified resource group.

output "resource_group_name" {
  value = azurerm_resource_group.KPA-Belfast23-connor-rg.name
}