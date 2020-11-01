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

module "azurerm_app_service_plan" {
  source = "./modules/app_service_plan"

  app_service_plan_name = var.app_service_plan_name
  app_service_plan_kind = var.app_service_plan_kind
  app_service_plan_sku_tier = var.app_service_plan_sku_tier
  app_service_plan_sku_size = var.app_service_plan_sku_size

  app_service_name = var.app_service_name
  app_service_deploy = var.app_service_deploy != "" ? 1 : 0

  # Dependencies
  rg_location = module.azurerm_resource_group.rg_location
  rg_name = module.azurerm_resource_group.rg_name

  depends_on = [module.azurerm_resource_group]
}
