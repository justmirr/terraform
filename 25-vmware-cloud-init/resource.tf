locals {
  templatevars = {}
}

resource "vsphere_virtual_machine" "cloudinit_vm" {
  name             = "terraform-001"
  resource_pool_id = data.vsphere_resource_pool.theresourcepool.id
  datastore_id     = data.vsphere_datastore.thedatastore.id
  host_system_id = data.vsphere_host.thehost.id
  num_cpus = 3
  memory   = 3072
  guest_id = data.vsphere_virtual_machine.template.guest_id
  firmware = data.vsphere_virtual_machine.template.firmware

  network_interface {
    network_id   = data.vsphere_network.thenetwork.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "Hard Disk 1"
    size             = 16
    thin_provisioned = true
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "terraform-001"
        domain    = "local"
      }
      network_interface {}
    }
  }
  extra_config = {
    "guestinfo.metadata"          = base64encode(templatefile("./cloud-init.yaml", local.templatevars))
    "guestinfo.metadata.encoding" = "base64"
    "guestinfo.networkconfig"     = base64encode(templatefile("./network-config.yaml", local.templatevars))
    "guestinfo.networkconfig.encoding" = "base64"
  }
}