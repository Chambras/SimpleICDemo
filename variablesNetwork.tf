## Networking variables
variable "vnetName" {
  type        = string
  default     = "Main"
  description = "VNet name."
}

locals {
  base_cidr_block  = "10.60.0.0/16"
  base_cidr_block2 = "10.70.0.0/16"

}
