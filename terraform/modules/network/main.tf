##################################################################################
# RESOURCES
##################################################################################

locals {
  network_name = join("-", ["rsdg", var.vlan_id, var.application_name])
}

data "vsphere_datacenter" "datacenter" {}

data "vsphere_host" "host" {
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "unifi_network" "network" {
  name    = local.network_name
  purpose = "corporate"

  subnet        = var.subnet
  vlan_id       = var.vlan_id
  dhcp_enabled  = false
  igmp_snooping = false
  multicast_dns = false
}

resource "vsphere_host_port_group" "pg" {
  name                = local.network_name
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = "vSwitch0"

  vlan_id = var.vlan_id
}

