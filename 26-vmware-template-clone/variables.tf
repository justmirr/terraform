# vSphere Data Variables
variable "vsphere_datacenter_name" {
  type = string
}
variable "vsphere_datastore_name" {
  type = string
}
variable "vsphere_compute_cluster_name" {
  type = string
}
variable "vsphere_resource_pool_name" {
  type = string
}
variable "vsphere_network_name" {
  type = string
}
variable "vsphere_host_name" {
  type = string
}
variable "vsphere_template_name" {
  type = string
}

# vSphere VM Variables
variable "vsphere_vm_name" {
  type = string
}
variable "vsphere_vm_num_cpus" {
  type = string
}
variable "vsphere_vm_memory" {
  type = string
}
variable "vsphere_vm_eagerly_scrub" {
  type    = bool
  default = false
}
variable "vsphere_vm_thin_provisioned" {
  type    = bool
  default = true
}
variable "vsphere_vm_customize_hostname" {
  type = string
}
variable "vsphere_vm_customize_domain" {
  type = string
}
variable "vsphere_vm_ipv4_address" {
  type = string
}
variable "vsphere_vm_ipv4_netmask" {
  type = string
}
variable "vsphere_vm_dns_server_list" {
  type = list(string)
}
variable "vsphere_vm_dns_suffix_list" {
  type = list(string)
}
variable "vsphere_vm_ipv4_gateway" {
  type = string
}