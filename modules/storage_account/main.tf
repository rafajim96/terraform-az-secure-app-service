resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

  # Dependencies
  resource_group_name = var.rg_name
  location            = var.rg_location

  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = [var.subnet_id]
  }

  lifecycle {
    ignore_changes = [network_rules]
  }

  count = var.storage_account_deploy
}