resource "vsphere_virtual_machine" "thevirtualmachine" {
  name = "happyterraform"
  resource_pool_id = data.vsphere_resource_pool.theresourcepool.id
  datastore_id = data.vsphere_datastore.thedatastore.id
  num_cpus = 2
  memory = 4096
  scsi_type = "lsilogic"
  disk {
    label = "Hard Disk 1"
    size = 10
    thin_provisioned = false
    eagerly_scrub = false
  }
  guest_id = "ubuntu64Guest"
  cdrom {
    datastore_id = data.vsphere_datastore.thedatastore.id
    path = "ISO/ubuntu-22.04.5-desktop-amd64.iso"
  }
  network_interface {
    network_id = data.vsphere_network.thenetwork.id
    adapter_type = "vmxnet3"
  }
}