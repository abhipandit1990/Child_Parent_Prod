terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "storageatfstate"
    resource_group_name  = "infosys"
    container_name       = "tfstatecontainer"
    key                  = "prod.tfstate"
  }
}
provider "azurerm" {
  features {}
}