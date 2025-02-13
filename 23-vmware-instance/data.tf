data "vsphere_datacenter" "datacenter" {
  name = "Datacenter"
}

data "vsphere_datastore" "thedatastore" {
  name = "datastore1"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "thecluster" {
  name = "Cluster"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "thenetwork" {
   name = "VM Network"
   datacenter_id = data.vsphere_datacenter.datacenter.id
}