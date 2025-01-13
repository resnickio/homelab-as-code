terraform {
  required_version = ">= 1.10.4"

  required_providers {
    unifi = {
      source  = "ubiquiti-community/unifi"
      version = ">= 0.41.2"
    }
    vsphere = {
      source  = "hashicorp/vsphere"
      version = ">= 2.10.0"
    }
  }
}