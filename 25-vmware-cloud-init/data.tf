data "vsphere_datacenter" "datacenter" {
  name = "Datacenter"
}

data "vsphere_datastore" "thedatastore" {
  name = "datastore1 (1)"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "theresourcepool" {
  name = "resource-pool"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "thenetwork" {
   name = "VM Network"
   datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = "rheltemplate"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host" "thehost" {
  name = "192.168.2.106"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}