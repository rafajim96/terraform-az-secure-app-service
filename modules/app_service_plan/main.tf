resource "azurerm_app_service_plan" "app_service_plan" {
  name = var.app_service_plan_name
  kind = var.app_service_plan_kind
  reserved = var.app_service_plan_reserved

  # Dependencies
  location = var.rg_location
  resource_group_name = var.rg_name

  sku {
    tier = var.app_service_plan_sku_tier
    size = var.app_service_plan_sku_size
  }
}

resource "azurerm_app_service" "app_service_container" {
  name                = var.app_service_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  # Dependencies
  location = var.rg_location
  resource_group_name = var.rg_name

  site_config {
    linux_fx_version = "DOCKER|appsvcsample/static-site:latest"
    always_on        = "true"
  }
}