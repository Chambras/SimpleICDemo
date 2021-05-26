variable "winVMName" {
  type        = string
  default     = "Windows"
  description = "Default Windows VM server name."
}

variable "windowsSKU" {
  type        = string
  default     = "2019-Datacenter"
  description = "Default VM SKU to be used in the VM."
}

variable "publicIPAllocation" {
  type        = string
  default     = "Static"
  description = "Default Public IP allocation. Could be Static or Dynamic."
}

variable "vmSize" {
  type        = string
  default     = "Standard_E2s_v3"
  description = "VM size."
}

variable "osDisk" {
  type        = string
  default     = "StandardSSD_LRS"
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS"
}

variable "devWinUserName" {
  type        = string
  default     = "marcelo"
  description = "Username to be added to the VM."
}

variable "windowsPassword" {
  type        = string
  default     = "DoNotStorePasswordsHere!!"
  description = "Windows password to use when creating the VM. It is not recommend to store these values here."
  sensitive   = true
}
