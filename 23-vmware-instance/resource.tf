resource "vsphere_virtual_machine" "thevirtualmachine" {
  name = "theterraform"
  resource_pool_id = data.vsphere_compute_cluster.thecluster.resource_pool_id
  datastore_id = data.vsphere_datastore.thedatastore.id
  num_cpus = 2
  memory = 2048
  scsi_type = "lsilogic"
  disk {
    label = "Hard Disk 1"
    size = 10
    thin_provisioned = false
    eagerly_scrub = false
  }
  guest_id = "Ubuntu64Guest"
  cdrom {
    datastore_id = data.vsphere_datastore.thedatastore.id
    path = "Ubuntu Server.iso"
  }

  network_interface {
    network_id = data.vsphere_network.thenetwork.id
    adapter_type = "vmxnet3"
  }
  wait_for_guest_ip_timeout = 0
  wait_for_guest_net_timeout = 0
}
