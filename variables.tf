# Declares a variable for the location of the resource group with a default value of "eastus". 
# This variable allows for customizable configuration of resource group's geographical placement.

variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

