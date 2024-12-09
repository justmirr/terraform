terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
      version = "6.19.0"
    }
  }
}

provider "oci" {
  tenancy_ocid = var.tenancy_id
  user_ocid = var.user_id
  private_key_path = var.private_path
  fingerprint = var.fingerprint
  region = var.region_id
}