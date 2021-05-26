## Security variables
variable "sourceIPs" {
  type        = list(any)
  default     = ["173.66.216.193"]
  description = "Public IPs to allow inboud communications."
}
