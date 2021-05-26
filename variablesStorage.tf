## Storage
variable "storageAccountName" {
  type        = string
  default     = "demodevenv"
  description = "Main Storage Account for VM Logs."
}

variable "saKind" {
  type        = string
  default     = "StorageV2"
  description = "Defines the Kind of account. Valid options are Storage, StorageV2 and BlobStorage."
}

variable "saTier" {
  type        = string
  default     = "Standard"
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium."
}

variable "saReplicationType" {
  type        = string
  default     = "GRS"
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
}

variable "fsName" {
  type        = string
  default     = "devsharefolder"
  description = "The name of the share. Must be unique within the storage account where the share is located."

}

variable "fsQuota" {
  type        = string
  default     = 200
  description = "The maximum size of the share, in gigabytes. Must be greater than 0, and less than or equal to 5 TB (5120 GB)."
}
