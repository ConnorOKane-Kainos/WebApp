# Specifies the Terraform configuration to use the "azurerm" provider from HashiCorp. 
# It explicitly requires version "3.69.0" of the "azurerm" provider. 
# Additionally, the provider block for "azurerm" is initialized with default features.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

