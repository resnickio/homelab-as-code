##################################################################################
# VARIABLES
##################################################################################

variable "application_name" {
  type        = string
  description = "The name of the application."
}

variable "subnet" {
  type        = string
  description = "The subnet's CIDR notation. (e.g. 192.168.1.1/24)"
}

variable "vlan_id" {
  type        = number
  description = "The VLAN ID for the new network."
}

