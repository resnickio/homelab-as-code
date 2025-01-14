##################################################################################
# RESOURCES
##################################################################################

# RSDG VCSA Infrastructure

# VCSA Network
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

# VCSA01 DNS
resource "unifi_user" "vcsa01" {
  mac  = "00:0C:29:11:ED:FC"
  name = "vcsa01.ad.rsdg.io"

  fixed_ip = "10.0.1.114"
}

# vSphere Configuration

# Terraform Tag Category
resource "vsphere_tag_category" "terraform" {
  name        = "terraform"
  description = "Tags for assets created and managed with Terraform."
  cardinality = "MULTIPLE"
  
  associable_types = [
    "Folder",
    "ClusterComputeResource",
    "Datacenter",
    "Datastore",
    "StoragePod",
    "DistributedVirtualPortgroup",
    "DistributedVirtualSwitch",
    "VmwareDistributedVirtualSwitch",
    "HostSystem",
    "com.vmware.content.Library",
    "com.vmware.content.library.Item",
    "HostNetwork",
    "Network",
    "OpaqueNetwork",
    "ResourcePool",
    "VirtualApp",
    "VirtualMachine",
  ]
}

# Terraform:Managed Tag
resource "vsphere_tag" "terraform_managed" {
  name        = "managed"
  category_id = "${vsphere_tag_category.terraform.id}"
  description = "Managed by Terraform"
}

# Ardenlee Datacenter
resource "vsphere_datacenter" "ardenlee" {
  name = "Ardenlee"

  tags = ["${vsphere_tag.terraform_managed.id}"]
}

# RSDG Ardenlee VDS