resource "vsphere_virtual_machine" "rhel_vm" {
  name             = var.vsphere_vm_name
  resource_pool_id = data.vsphere_resource_pool.resourcepool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.vsphere_vm_num_cpus
  memory   = var.vsphere_vm_memory
  guest_id = data.vsphere_virtual_machine.template.guest_id
  firmware = data.vsphere_virtual_machine.template.firmware

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = var.vsphere_vm_eagerly_scrub
    thin_provisioned = var.vsphere_vm_thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = var.vsphere_vm_customize_hostname
        domain    = var.vsphere_vm_customize_domain
      }

      network_interface {
        ipv4_address = var.vsphere_vm_ipv4_address
        ipv4_netmask = var.vsphere_vm_ipv4_netmask

      }
      dns_server_list = var.vsphere_vm_dns_server_list
      dns_suffix_list = var.vsphere_vm_dns_suffix_list
      ipv4_gateway    = var.vsphere_vm_ipv4_gateway
    }
  }
  wait_for_guest_net_timeout = 30
}
