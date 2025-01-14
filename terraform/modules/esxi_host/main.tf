##################################################################################
# DATA
##################################################################################

data "vsphere_host_thumbprint" "thumbprint" {
    address  = var.fqdn
    insecure = var.insecure
}

data "vsphere_datacenter" "datacenter" {
    name = var.datacenter
}

data "vsphere_tag_category" "terraform" {
    name = "terraform"
}

data "vsphere_tag" "terraform_managed" {
    name        = "managed"
    category_id = data.vsphere_tag_category.terraform.id
}

##################################################################################
# LOCALS
##################################################################################

locals {}

##################################################################################
# RESOURCES
##################################################################################

resource "unifi_user" "unifi_host" {
  mac  = var.mac_address
  name = var.fqdn

  fixed_ip = var.ip_address
}

resource "vsphere_host" "esxi_host" {
  hostname   = var.fqdn
  username   = var.esxi_username
  password   = var.esxi_password
  thumbprint = data.vsphere_host_thumbprint.thumbprint.id
  datacenter = data.vsphere_datacenter.datacenter.id

  services {
    ntpd {
      enabled     = true
      policy      = "on"
      ntp_servers = var.ntp_servers
    }
  }

  tags = ["${data.vsphere_tag.terraform_managed.id}"]
}