variable "devRHUserName" {
  type        = string
  default     = "demoAdmin"
  description = "Username to be added to the VM."
}

variable "devRHsshKeyPath" {
  type        = string
  default     = "~/.ssh/vm_ssh.pub"
  description = "SSH Key path to use when creating the VM."
  sensitive   = true
}

variable "devRHPublicIPName" {
  type        = string
  default     = "PublicIP"
  description = "Default Public IP name."
}

variable "devRHPublicIPAllocation" {
  type        = string
  default     = "Static"
  description = "Default Public IP allocation. Could be Static or Dynamic."
}

variable "devRHNIName" {
  type        = string
  default     = "NIC"
  description = "Default RedHat Network Interface Name."
}

variable "devRHVMsku" {
  type        = string
  default     = "77-gen2"
  description = "VM OS version to be used."
}

variable "devRHVMName" {
  type        = string
  default     = "DevRH"
  description = "Default JumpBox VM server name."
}

variable "devRHVMSize" {
  type        = string
  default     = "Standard_E2s_v3"
  description = "VM size."
}

variable "devRHosDisk" {
  type        = string
  default     = "StandardSSD_LRS"
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS"
}
