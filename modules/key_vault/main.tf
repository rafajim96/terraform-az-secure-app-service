resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  sku_name                    = var.key_vault_sku #standard
  enabled_for_disk_encryption = true
  soft_delete_enabled         = true
  #soft_delete_retention_days  = 7
  purge_protection_enabled = false

  # Dependencies
  location            = var.rg_location
  resource_group_name = var.rg_name
  tenant_id           = var.tenant_id

  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    virtual_network_subnet_ids = [var.subnet_id]
  }

  lifecycle {
    ignore_changes = [network_acls]
  }
}