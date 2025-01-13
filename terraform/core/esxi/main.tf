##################################################################################
# DATA
##################################################################################

data "vsphere_datacenter" "datacenter" {}

data "vsphere_host" "host" {
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "pool" {
  name          = join("", [var.vsphere_server, "/Resources"])
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

##################################################################################
# RESOURCES
##################################################################################

# RSDG ESXi Networks

resource "unifi_network" "rsdg-101-esxi-management" {
  name    = "rsdg-101-esxi-management"
  purpose = "corporate"

  subnet  = "10.0.1.0/27"
  vlan_id = 101

  intra_network_access_enabled = true
  internet_access_enabled      = true
  igmp_snooping                = false
  multicast_dns                = false
  
  dhcp_enabled = true
  dhcp_start   = "10.0.1.2"
  dhcp_stop    = "10.0.1.30"
}

resource "unifi_network" "rsdg-102-esxi-vmotion" {
  name    = "rsdg-102-esxi-vmotion"
  purpose = "corporate"

  subnet  = "10.0.1.32/27"
  vlan_id = 102

  intra_network_access_enabled = false
  internet_access_enabled      = false
  igmp_snooping                = false
  multicast_dns                = false
  
  dhcp_enabled = true
  dhcp_start   = "10.0.1.34"
  dhcp_stop    = "10.0.1.62"
}

resource "unifi_network" "rsdg-103-esxi-vsan" {
  name    = "rsdg-103-esxi-vsan"
  purpose = "corporate"

  subnet  = "10.0.1.64/27"
  vlan_id = 103

  intra_network_access_enabled = false
  internet_access_enabled      = false
  igmp_snooping                = false
  multicast_dns                = false
  
  dhcp_enabled = true
  dhcp_start   = "10.0.1.66"
  dhcp_stop    = "10.0.1.94"
}

# Virtualization Port Group

resource "unifi_port_profile" "virtualization" {
  name = "rsdg-virtualization"

  native_networkconf_id = unifi_network.rsdg-101-esxi-management.id
  poe_mode              = "off"
  lldpmed_enabled       = "false"
}

# ESXi Hosts

resource "unifi_user" "esxi00" {
  mac  = "B8:CA:3A:60:B4:14"
  name = "esxi00"

  fixed_ip = "10.0.1.29"
}

# RSDG Console Network

resource "unifi_network" "rsdg-104-console" {
  name    = "rsdg-104-console"
  purpose = "corporate"

  subnet  = "10.0.1.96/29"
  vlan_id = 104

  intra_network_access_enabled = true
  internet_access_enabled      = false
  igmp_snooping                = false
  multicast_dns                = false
  
  dhcp_enabled = true
  dhcp_start   = "10.0.1.97"
  dhcp_stop    = "10.0.1.102"
}

resource "unifi_user" "esxi00-console" {
  mac  = "5C:F9:DD:F2:9C:B2"
  name = "esxi00-console"

  fixed_ip = "10.0.1.102"
}


