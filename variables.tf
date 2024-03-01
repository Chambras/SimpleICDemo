variable "location" {
  type        = string
  default     = "eastus2"
  description = "Location where the resoruces are going to be created."
}

variable "suffix" {
  type        = string
  default     = "Demo"
  description = "To be added at the beginning of each resource."
}

variable "rgName" {
  type        = string
  default     = "genericRG"
  description = "Resource Group Name."
}

variable "tags" {
  type = map(any)
  default = {
    "Environment" = "Development"
    "Project"     = "Demo IC"
    "BillingCode" = "Internal"
    "Customer"    = "Demo"
    "POC"         = "Marcelo Zambrana"
  }
}
