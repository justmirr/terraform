# compartment
resource "oci_identity_compartment" "thecompartment" {
  compartment_id = var.parent_compartment
  description = "happy's terraform compartment"
  name = "happy-compartment"
}

# vcn
resource "oci_core_vcn" "thevcn" {
  compartment_id = oci_identity_compartment.thecompartment.id
  display_name = "happy-vcn"
  cidr_blocks = ["10.0.0.0/16"]
}

# security list
resource "oci_core_security_list" "thesecuritylist" {
  vcn_id = oci_core_vcn.thevcn.id
  compartment_id = oci_identity_compartment.thecompartment.id
  ingress_security_rules {
    source = "0.0.0.0/0"
    protocol = "all"
  } 
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol = "all"
  }
}

# internet gateway
resource "oci_core_internet_gateway" "theinternetgateway" {
  compartment_id = oci_identity_compartment.thecompartment.id
  vcn_id = oci_core_vcn.thevcn.id
  display_name = "happy-internet-gateway"
}

# route table
resource "oci_core_route_table" "theroutetable" {
  vcn_id = oci_core_vcn.thevcn.id
  compartment_id = oci_identity_compartment.thecompartment.id
  display_name = "happy-route-table"
}

# subnet
resource "oci_core_subnet" "thepublicsubnet" {
  vcn_id = oci_core_vcn.thevcn.id
  compartment_id = oci_identity_compartment.thecompartment.id
  security_list_ids = [oci_core_security_list.thesecuritylist.id]
  cidr_block = "10.0.0.0/24"
  display_name = "happy-public-subnet"
}

# instance
resource "oci_core_instance" "theinstance" {
  compartment_id = oci_identity_compartment.thecompartment.id
  availability_domain = data.oci_identity_availability_domains.theavailabilitydomains.availability_domains[0].name
  display_name = "happy-instance"
  shape = var.instance_shape
  source_details {
    source_type = "image"
    source_id = var.image_id
  }
  create_vnic_details {
    subnet_id = oci_core_subnet.thepublicsubnet.id
    assign_public_ip = true
  }
  metadata = {
    ssh_authorized_keys = file(var.public_path)
  }
  preserve_boot_volume = false
}