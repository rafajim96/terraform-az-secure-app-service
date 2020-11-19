resource "azurerm_container_registry" "acr" {
  name = var.container_registry_name
  # The SKU is REQUIRED to be Premium in order to have FW functionalities
  sku = "Premium"
  # The Admin Enabled is RECOMMENDED to be activated but not required
  admin_enabled = true

  # Dependencies
  resource_group_name = var.rg_name
  location            = var.rg_location

  network_rule_set {
    default_action = "Deny"
    virtual_network {
      action   = "Allow"
      subnet_id = var.subnet_id
    }
  }

  lifecycle {
    ignore_changes = [network_rule_set]
  }

  count = var.container_registry_deploy
}