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