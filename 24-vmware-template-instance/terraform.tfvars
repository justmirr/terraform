cpu                    = 3
cores-per-socket       = 1
ram                    = 3072
disksize               = 16
vsphere-unverified-ssl = "true"
vsphere-datacenter     = "Datacenter"
vsphere-rsp        = "resource-pool"
vm-datastore           = "datastore1 (1)"
vm-network             = "VM Network"
dns_server_list        = ["8.8.8.8","8.8.4.4"]
name                   = "terraform-2"
ipv4_address           = "192.168.3.43"
ipv4_gateway           = "192.168.3.1"
ipv4_netmask           = "24"
vm-template-name       = "rheltemplate"

ssh_username = "happy"

public_key = "<ssh-public-key>"