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

# Dependencies ---------------------------------------------------------------------------------------------------------------------------------------------------------------
variable "rg_name" {
  description = "Name of the RG created as dependency."
  type        = string
}

variable "rg_location" {
  description = "Location of the RG created as dependency."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID used for the Storage Account FW Rule."
  type        = string
}