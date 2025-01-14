##################################################################################
# DATA
##################################################################################

data "vsphere_host_thumbprint" "esxi00" {
  address  = "esxi00.ad.rsdg.io"
  insecure = true
}

data "vsphere_host_thumbprint" "esxi02" {
  address  = "esxi02.ad.rsdg.io"
  insecure = true
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

# ESXi Hosts

# ESXi00 Dell R720
module "esxi00" {
  source = "./../modules/esxi_host"

  fqdn        = "esxi00.ad.rsdg.io"
  insecure    = true
  datacenter  = "Ardenlee"
  mac_address = "B8:CA:3A:60:B4:14"
  ip_address  = "10.0.1.29"

  esxi_username = "root"
  esxi_password = var.vsphere_password
  
  ntp_servers = ["ntp.rsdg.io"]
}

# ESXi01 - Dell R740
# resource "unifi_user" "esxi01" {
#   mac  = "B8:CA:3A:60:B4:14"
#   name = "esxi01"

#   fixed_ip = "10.0.1.11"
# }

# ESXi02 - Dell Precision 7820
module "esxi02" {
  source = "./../modules/esxi_host"

  fqdn        = "esxi02.ad.rsdg.io"
  insecure    = true
  datacenter  = "Ardenlee"
  mac_address = "A4:BB:6D:9f:42:0C"
  ip_address  = "10.0.1.12"

  esxi_username = "root"
  esxi_password = var.vsphere_password
  
  ntp_servers = ["ntp.rsdg.io"]
}
