resource "azurerm_app_service_plan" "app_service_plan" {
  name     = var.app_service_plan_name
  kind     = var.app_service_plan_kind
  reserved = var.app_service_plan_reserved

  # Dependencies
  location            = var.rg_location
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
  location            = var.rg_location
  resource_group_name = var.rg_name

  site_config {
    linux_fx_version = "DOCKER|appsvcsample/static-site:latest"
    always_on        = "true"
  }

  count = var.app_service_deploy
}

resource "azurerm_virtual_network" "vnet" {
  name          = var.virtual_network_name
  address_space = [var.virtual_network_address_space]

  # Dependencies
  location            = var.rg_location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "snet" {
  name                 = var.subnet_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefixes]

  # Dependencies
  resource_group_name = var.rg_name

  delegation {
    name = "example-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }

  service_endpoints = ["Microsoft.ContainerRegistry", "Microsoft.KeyVault", "Microsoft.SQL", "Microsoft.Storage"]
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  app_service_id = azurerm_app_service.app_service_container[count.index].id
  subnet_id      = azurerm_subnet.snet.id

  # Will only be created if the App Service was deployed
  count = var.app_service_deploy
}