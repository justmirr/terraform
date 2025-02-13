provider "vsphere" {
  user = var.user
  password = var.password
  vsphere_server = "192.168.2.30"
  allow_unverified_ssl = true
}