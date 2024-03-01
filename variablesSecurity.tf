## Security variables
variable "sourceIPs" {
  type        = list(any)
  default     = ["20.161.17.175", "13.72.117.76"]
  description = "Public IPs to allow inboud communications."
}
