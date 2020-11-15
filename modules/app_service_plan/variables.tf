variable "app_service_plan_name" {
  description = "Name of the App Service Plan to be created."
  type        = string
}

variable "app_service_plan_kind" {
  description = "OS kind of App Service Plan to be created. (Windows or Linux)"
  type        = string

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
  default     = "Standard"

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

# Dependencies ---------------------------------------------------------------------------------------------------------------------------------------------------------------
variable "rg_name" {
  description = "Name of the RG created as dependency."
  type        = string
}

variable "rg_location" {
  description = "Location of the RG created as dependency."
  type        = string
}