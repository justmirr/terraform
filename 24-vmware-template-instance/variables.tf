variable "user" {
  type = string
}

variable "password" {
  type = string
}

variable "bvsphere_server" {
  type = string
}

variable "cpu" {
  type = number
}

variable "cores-per-socket" {
  type = number
}

variable "ram" {
  type = number
}

variable "disksize" {
  type = number
}
 
variable "vsphere-unverified-ssl" {
  type = string
}
 
variable "vsphere-datacenter" {
  type = string
}
 
variable "vsphere-rsp" {
  type = string
}
 
variable "vm-datastore" {
  type = string
}
 
variable "vm-network" {
  type = string
}
 
variable "name" {
  type = string
}
 
variable "ipv4_address" {
  type = string
}
 
variable "ipv4_gateway" {
  type = string
}
 
variable "ipv4_netmask" {
  type = string
}
 
variable "vm-template-name" {
  type = string
}
 
variable "dns_server_list" {
  type = list(string)
}

variable "ssh_username" {
  type = string
}

variable "public_key" {
  type = string
}