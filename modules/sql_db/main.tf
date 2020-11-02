resource "azurerm_sql_server" "sql_server" {
  name                         = var.sql_server_name
  version                      = "12.0"
  administrator_login          = var.sql_server_username
  administrator_login_password = var.sql_server_password

  # Dependencies
  location = var.rg_location
  resource_group_name = var.rg_name

  count = var.sql_server_deploy
}

resource "azurerm_sql_database" "sq_db" {
  name         = var.sql_db_name
  server_name  = azurerm_sql_server.sql_server[count.index].name
  edition      = var.sql_db_edition

  # Dependencies
  location = var.rg_location
  resource_group_name = var.rg_name

  count = var.sql_server_deploy
}