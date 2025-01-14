##################################################################################
# VARIABLES
##################################################################################

# Unifi Credentials

variable "unifi_api" {
  type        = string
  description = "The fully qualified domain name or IP address of the Unifi Controller API URL."
}

variable "unifi_username" {
  type        = string
  description = "The username to login to the Unifi Controller."
  sensitive   = true
}

variable "unifi_password" {
  type        = string
  description = "The password for the login to the Unifi Controller instance."
  sensitive   = true
}

variable "unifi_insecure" {
  type        = bool
  description = "Set to true for self-signed certificates."
  default     = false
}

# vSphere/ESXi Credentials

variable "vsphere_server" {
  type        = string
  description = "The fully qualified domain name or IP address of the vCenter Server instance. (e.g. sfo-m01-vc01.sfo.example.com)"
}

variable "vsphere_username" {
  type        = string
  description = "The username to login to the vCenter Server instance. (e.g. administrator@vsphere.local)"
  sensitive   = true
}

variable "vsphere_password" {
  type        = string
  description = "The password for the login to the vCenter Server instance."
  sensitive   = true
}

variable "vsphere_insecure" {
  type        = bool
  description = "Set to true for self-signed certificates."
  default     = false
}
