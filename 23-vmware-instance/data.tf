data "vsphere_datacenter" "datacenter" {
  name = "Datacenter"
}

data "vsphere_datastore" "thedatastore" {
  name = "datastore1"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "theresourcepool" {
  name = "rsp"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "thenetwork" {
   name = "VM Network"
   datacenter_id = data.vsphere_datacenter.datacenter.id
}