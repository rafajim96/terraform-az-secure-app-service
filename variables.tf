variable "client_id" {
  description = "Client ID of the Azure Service Principal"
  type = string
}

variable "client_secret" {
  description = "Client Secret of the Azure Service Principal"
  type = string
}

variable "tenant_id" {
  description = "Tenant ID of the Azure Environment"
  type = string
}

variable "subscription_id" {
  description = "Subscription ID of the Azure Environment"
  type = string
}

# RG VARIABLES ----------------------------------------------------------------------------------------------------------------------------------------------------
variable "rg_name" {
  description = "Name of the RG"
  type = string
}

variable "rg_location" {
  description = "Location of the RG"
  type = string
}

variable "rg_tags" {
  description = "Tags to be added to the RG"
  type = map(string)
  default = {
  }
}

# APP SERVICE PLAN VARIABLES --------------------------------------------------------------------------------------------------------------------------------------
variable "app_service_plan_name" {
  description = "Name of the App Service Plan to bre created."
  type = string
}

variable "app_service_plan_kind" {
  description = "OS kind of App Service Plan to be created. (Windows or Linux)"
  type = string
  default = "Linux"

  validation {
    condition = contains(["Windows", "Linux"], var.app_service_plan_kind)
    error_message = "Argument \"OS Kind\" must be either \"Windows\" or \"Linux\"."
  }
}

variable "app_service_plan_reserved" {
  description = "Reserved value must be true when deplloying Linux ASP."
  type = bool
  default = true
}

variable "app_service_plan_sku_tier" {
  description = "Tier of the App Service Plan SKU"
  type = string
  default = "Free"

  validation {
    condition = contains(["Free", "Shared", "Basic", "Standard", "Premium", "PremiumV2", "PremiumV3", "Isolated"], var.app_service_plan_sku_tier)
    error_message = "Argument \"SKU Tier\" must be either \"Free\", \"Shared\", \"Basic\", \"Standard\", \"Premium\", \"PremiumV2\", \"PremiumV3\", or \"Isolated\"."
  }
}

variable "app_service_plan_sku_size" {
  description = "Size of the App Service Plan SKU"
  type = string
  default = "S1"

  validation {
    condition = contains(["B1", "B2", "B3", "D1", "F1", "FREE", "I1", "I2", "I3", "P1V2", "P1V3", "P2V2", "P2V3", "P3V2", "P3V3", "PC2", "PC3", "PC4", "S1", "S2", "S3", "SHARED"], var.app_service_plan_sku_size)
    error_message = "Argument \"SKU Size\" must be either \"B(1, 2, 3)\", \"D1\", \"F1\", \"FREE\", \"I(1, 2, 3)\", \"P1V(2, 3)\", \"P2V(2, 3)\", \"P3V(2, 3)\", \"PC(2, 3, 4)\", \"S(1, 2, 3)\", or \"SHARED\"."
  }
}

variable "app_service_name" {
  description = "Name of the App Service to be created."
  type = string
}

variable "app_service_deploy" {
  description = "Variable to decide if the resource will be deployed."
  type = string
  default = ""
}