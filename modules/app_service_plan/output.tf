output "app_service_name" {
  value = azurerm_app_service.app_service_container[0].name
}

output "subnet_id" {
  value = azurerm_subnet.snet.id
}