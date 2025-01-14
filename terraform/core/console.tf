##################################################################################
# RESOURCES
##################################################################################

# RSDG Console Network

resource "unifi_network" "rsdg-104-console" {
  name    = "rsdg-104-console"
  purpose = "corporate"

  subnet  = "10.0.1.96/28"
  vlan_id = 104

  intra_network_access_enabled = true
  internet_access_enabled      = false
  igmp_snooping                = false
  multicast_dns                = false
  
  dhcp_enabled = true
  dhcp_start   = "10.0.1.98"
  dhcp_stop    = "10.0.1.110"
}

# Console Hosts

# Dell R740 iDRAC
# resource "unifi_user" "esxi01-console" {
#   mac  = ""
#   name = "esxi01"

#   fixed_ip = "10.0.1.98"
# }

# Dell R720 iDRAC
resource "unifi_user" "esxi00-console" {
  mac  = "5C:F9:DD:F2:9C:B2"
  name = "esxi00-console"

  fixed_ip = "10.0.1.102"
}