output "thedatacenter" {
  value = data.vsphere_datacenter.datacenter.id
}

output "thedatastore" {
  value = data.vsphere_datastore.thedatastore.id
}