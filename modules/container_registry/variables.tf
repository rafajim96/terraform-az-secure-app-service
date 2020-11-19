variable "container_registry_name" {
  description = "Name for the Container Registry."
  type        = string
}

variable "container_registry_deploy" {
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
  description = "Subnet ID used for the Key Vault FW Rule."
  type        = string
}