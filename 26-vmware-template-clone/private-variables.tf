# vSphere Provider Variables
variable "vsphere_user" {
  type = string
}
variable "vsphere_password" {
  type = string
}
variable "vsphere_server" {
  type = string
}
variable "vsphere_allow_unverified_ssl" {
  type    = bool
  default = true
}