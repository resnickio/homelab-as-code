##################################################################################
# RESOURCES
##################################################################################

# RSDG VCSA Network

resource "unifi_network" "rsdg-105-vcsa" {
  name    = "rsdg-105-vcsa"
  purpose = "corporate"

  subnet  = "10.0.1.112/28"
  vlan_id = 105

  intra_network_access_enabled = true
  internet_access_enabled      = true
  igmp_snooping                = false
  multicast_dns                = false
  
  dhcp_enabled = true
  dhcp_start   = "10.0.1.114"
  dhcp_stop    = "10.0.1.126"
}

# VCSA Hosts

# vcsa01.ad.rsdg.io
resource "unifi_user" "vcsa01" {
  mac  = "00:0C:29:11:ED:FC"
  name = "vcsa01.ad.rsdg.io"

  fixed_ip = "10.0.1.114"
}
