##################################################################################
# PROVIDERS
##################################################################################

provider "unifi" {
  api_url        = var.unifi_api
  username       = var.unifi_username
  password       = var.unifi_password
  allow_insecure = var.unifi_insecure
}

provider "vsphere" {
  vsphere_server       = var.vsphere_server
  user                 = var.vsphere_username
  password             = var.vsphere_password
  allow_unverified_ssl = var.vsphere_insecure
}