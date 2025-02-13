data "vsphere_datacenter" "dc" {
  name = var.vsphere-datacenter
}
data "vsphere_datastore" "datastore" {
  name          = var.vm-datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "rsp" {
  name = var.vsphere-rsp
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vm-network
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_virtual_machine" "template" {
  name          = "${var.vm-template-name}"
  datacenter_id = data.vsphere_datacenter.dc.id
}