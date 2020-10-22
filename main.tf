 provider "azurerm" {
  version = "~>2.19.0"
  features {}

  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
  subscription_id = var.subscription_id

  # Use managed identity for Authentication
  use_msi = true
}

module "azurerm_resource_group" {
  source = "./modules/resource_group"
  
  rg_name = var.rg_name
  rg_location = var.rg_location
  rg_tags = var.rg_tags
}