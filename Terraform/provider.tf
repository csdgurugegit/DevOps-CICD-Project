terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
 subscription_id = "<add-subscription-id>"
 client_id = "<add-client-id>"
 client_secret = "<add-client-secret>"
 tenant_id =  "<add-tenant-id>"
 features {}
}
