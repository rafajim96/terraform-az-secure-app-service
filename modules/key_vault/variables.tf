variable "key_vault_name" {
  description = "Name for the Key Vault."
  type        = string
}

variable "key_vault_sku" {
  description = "SKU for the Key Vault."
  type        = string
  default     = "standard"
}

# Dependencies ---------------------------------------------------------------------------------------------------------------------------------------------------------------
variable "rg_name" {
  description = "Name of the RG created as dependency."
  type        = string
}

variable "rg_location" {
  description = "Location of the RG created as dependency."
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID required for Key Vault creation."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID used for the Key Vault FW Rule."
  type        = string
}