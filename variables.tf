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