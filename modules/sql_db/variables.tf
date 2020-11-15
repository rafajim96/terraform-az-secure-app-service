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

# Dependencies ---------------------------------------------------------------------------------------------------------------------------------------------------------------
variable "rg_name" {
  description = "Name of the RG created as dependency."
  type        = string
}

variable "rg_location" {
  description = "Location of the RG created as dependency."
  type        = string
}

variable "app_service_name" {
  description = "App Service Name used for the SQL VNet FW Rule."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID used for the SQL VNet FW Rule."
  type        = string
}