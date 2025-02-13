provider "vsphere" {
  user = var.user
  password = var.password
  vsphere_server = var.bvsphere_server
  allow_unverified_ssl = true
}

locals {
  templatevars = {
    name         = var.name,
    ipv4_address = var.ipv4_address,
    ipv4_gateway = var.ipv4_gateway,
    dns_server_1 = var.dns_server_list[0],
    dns_server_2 = var.dns_server_list[1],
    public_key = var.public_key,
    ssh_username = var.ssh_username
  }
}