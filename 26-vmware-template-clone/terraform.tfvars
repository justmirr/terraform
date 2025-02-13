# vSphere Provider Variables
vsphere_server               = "192.168.2.30"
vsphere_allow_unverified_ssl = true

# vSphere Data Variables
vsphere_datacenter_name      = "Datacenter"
vsphere_datastore_name       = "datastore1 (1)"
vsphere_compute_cluster_name = "Cluster"
vsphere_resource_pool_name   = "resource-pool"
vsphere_network_name         = "VM Network"
vsphere_host_name            = "192.168.2.106"
vsphere_template_name        = "testtemplate1"

# vSphere VM Variables
vsphere_vm_name               = "UB_VM_001"
vsphere_vm_num_cpus           = "3"
vsphere_vm_memory             = "3072"
vsphere_vm_eagerly_scrub      = false
vsphere_vm_thin_provisioned   = true
vsphere_vm_customize_hostname = "rhel-vm"
vsphere_vm_customize_domain   = "rhelvm.local"
vsphere_vm_ipv4_address       = "192.168.3.43"
vsphere_vm_ipv4_netmask       = "24"
vsphere_vm_dns_server_list    = ["8.8.8.8", "8.8.4.4"]
vsphere_vm_dns_suffix_list    = ["google.com"]
vsphere_vm_ipv4_gateway       = "192.168.3.1"