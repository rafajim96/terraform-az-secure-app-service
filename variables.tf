variable "client_id" {
  description = "Client ID of the Azure Service Principal"
  type        = string
}

variable "client_secret" {
  description = "Client Secret of the Azure Service Principal"
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID of the Azure Environment"
  type        = string
}

variable "subscription_id" {
  description = "Subscription ID of the Azure Environment"
  type        = string
}

# RG VARIABLES ----------------------------------------------------------------------------------------------------------------------------------------------------
variable "rg_name" {
  description = "Name of the RG"
  type        = string
}

variable "rg_location" {
  description = "Location of the RG"
  type        = string
}

variable "rg_tags" {
  description = "Tags to be added to the RG"
  type        = map(string)
  default = {
  }
}

# APP SERVICE PLAN VARIABLES --------------------------------------------------------------------------------------------------------------------------------------
variable "app_service_plan_name" {
  description = "Name of the App Service Plan to bre created."
  type        = string
}

variable "app_service_plan_kind" {
  description = "OS kind of App Service Plan to be created. (Windows or Linux)"
  type        = string
  default     = "Linux"

  validation {
    condition     = contains(["Windows", "Linux"], var.app_service_plan_kind)
    error_message = "Argument \"OS Kind\" must be either \"Windows\" or \"Linux\"."
  }
}

variable "app_service_plan_reserved" {
  description = "Reserved value must be true when deplloying Linux ASP."
  type        = bool
  default     = true
}

variable "app_service_plan_sku_tier" {
  description = "Tier of the App Service Plan SKU"
  type        = string
  default     = "Free"

  validation {
    condition     = contains(["Free", "Shared", "Basic", "Standard", "Premium", "PremiumV2", "PremiumV3", "Isolated"], var.app_service_plan_sku_tier)
    error_message = "Argument \"SKU Tier\" must be either \"Free\", \"Shared\", \"Basic\", \"Standard\", \"Premium\", \"PremiumV2\", \"PremiumV3\", or \"Isolated\"."
  }
}

variable "app_service_plan_sku_size" {
  description = "Size of the App Service Plan SKU"
  type        = string
  default     = "S1"

  validation {
    condition     = contains(["B1", "B2", "B3", "D1", "F1", "FREE", "I1", "I2", "I3", "P1V2", "P1V3", "P2V2", "P2V3", "P3V2", "P3V3", "PC2", "PC3", "PC4", "S1", "S2", "S3", "SHARED"], var.app_service_plan_sku_size)
    error_message = "Argument \"SKU Size\" must be either \"B(1, 2, 3)\", \"D1\", \"F1\", \"FREE\", \"I(1, 2, 3)\", \"P1V(2, 3)\", \"P2V(2, 3)\", \"P3V(2, 3)\", \"PC(2, 3, 4)\", \"S(1, 2, 3)\", or \"SHARED\"."
  }
}

variable "app_service_name" {
  description = "Name of the App Service to be created."
  type        = string
}

variable "app_service_deploy" {
  description = "Variable to decide if the resource will be deployed."
  type        = string
  default     = ""
}

# SQL RESOURCE VARIABLES --------------------------------------------------------------------------------------------------------------------------------------
variable "sql_server_name" {
  description = "Name of the SQL Server."
  type        = string
}

variable "sql_server_username" {
  description = "Username for the SQL Server."
  type        = string
}

variable "sql_server_password" {
  description = "Password for the SQL Server."
  type        = string
}

variable "sql_server_deploy" {
  description = "Variable to decide if the resource will be deployed."
  type        = string
  default     = ""
}

variable "sql_db_name" {
  description = "Name for the SQL DB."
  type        = string
}

variable "sql_db_edition" {
  description = "Edition of the SQL DB related to pricing."
  type        = string
  default     = "Free"

  validation {
    condition     = contains(["Free", "Basic", "Standard", "DataWarehouse", "Premium"], var.sql_db_edition)
    error_message = "Argument \"SQL DB Edition\" must be either \"Free\", \"Basic\", \"Standard\", \"DataWarehouse\", or \"Premium\"."
  }
}

# VIRTUAL NETWORK RESOURCE VARIABLES --------------------------------------------------------------------------------------------------------------------------------------
variable "virtual_network_name" {
  description = "Name of the Virtual network to be created."
  type        = string
}

variable "virtual_network_address_space" {
  description = "Address space to be used on VNet creation."
  type        = string
}

variable "subnet_name" {
  description = "Name of the Subnet to be created."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Address prefix to be used on Subnet creation."
  type        = string
}

# KEY VAULT RESOURCE VARIABLES --------------------------------------------------------------------------------------------------------------------------------------
variable "key_vault_name" {
  description = "Name for the Key Vault."
  type        = string
}

variable "key_vault_sku" {
  description = "SKU for the Key Vault."
  type        = string
  default     = "standard"
}

# STORAGE ACCOUNT RESOURCE VARIABLES --------------------------------------------------------------------------------------------------------------------------------------
variable "storage_account_name" {
  description = "Name for the Storage Account."
  type        = string
}

variable "storage_account_tier" {
  description = "Tier for the Storage Account"
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Standard", "Premium"], var.storage_account_tier)
    error_message = "Argument \"Storage Account Tier\" must be either \"Standard\", or \"Premium\"."
  }
}

variable "storage_account_replication_type" {
  description = "Replication type for the Storage Account."
  type        = string
  default     = "LRS"

  validation {
    condition     = contains(["LRS", "GRS", "RA-GRS", "ZRS"], var.storage_account_replication_type)
    error_message = "Argument \"Storage Account Replication Type\" must be either \"LRS\", \"GRS\", \"RA-GRS\", or \"ZRS\"."
  }
}

variable "storage_account_deploy" {
  description = "Variable to decide if the resource will be deployed."
  type        = string
  default     = ""
}

# CONTAINER REGISTRY RESOURCE VARIABLES --------------------------------------------------------------------------------------------------------------------------------------
variable "container_registry_name" {
  description = "Name for the Container Registry."
  type        = string
}

variable "container_registry_deploy" {
  description = "Variable to decide if the resource will be deployed."
  type        = string
  default     = ""
}