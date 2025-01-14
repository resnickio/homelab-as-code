##################################################################################
# VARIABLES
##################################################################################

variable "fqdn" {
  type        = string
  description = "Fully qualified domain name of the ESXi host."
}

variable "insecure" {
  type        = bool
  description = "Disables SSL certificate verification."
  default     = false
}

variable "datacenter" {
  type        = string
  description = "The name of the datacenter for the ESXi host."
}

variable "mac_address" {
  type        = string
  description = "MAC address of the ESXi host's management NIC. Ex: 01:23:45:67:89:0A"
}

variable "ip_address" {
  type        = string
  description = "IP address for the ESXi host."
}

variable "esxi_username" {
  type        = string
  description = "The username for the ESXi host."
}

variable "esxi_password" {
  type        = string
  description = "The password for the ESXi host."
  sensitive   = true
}

variable "ntp_servers" {
  type        = list(string)
  description = "List of NTP servers by IP address or hostname."
}