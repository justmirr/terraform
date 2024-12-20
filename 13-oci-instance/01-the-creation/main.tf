provider "oci" {
  tenancy_ocid     = "***"
  user_ocid        = "***"
  private_key_path = "C:/Users/moazi/Downloads/privatekey1.pem"
  fingerprint      = "***"
  region           = "ap-tokyo-1"
}

resource "oci_identity_compartment" "thecompartment" {
  compartment_id = "***"
  description = "happy's terraform compartment"
  name = "happy-compartment"
}

resource "oci_core_vcn" "thevcn" {
  compartment_id = oci_identity_compartment.thecompartment.id
  display_name = "happy-vcn"
  dns_label = "happyvcn"
  cidr_blocks = ["10.0.0.0/24"]
}

resource "oci_core_subnet" "thepublicsubnet" {
  compartment_id = "${oci_identity_compartment.thecompartment.compartment_id}"
  vcn_id = oci_core_vcn.thevcn.id
  cidr_block = "10.0.0.0/24"
  display_name = "happy-private-subnet"
}

output "thesubnetoutput" {
  value = [oci_core_subnet.thepublicsubnet.id, oci_core_subnet.thepublicsubnet.display_name]
}

resource "oci_core_internet_gateway" "theinternetgateway" {
  compartment_id = oci_identity_compartment.thecompartment.id
  vcn_id = oci_core_vcn.thevcn.id
  display_name = "happy-internet-gateway"
}

resource "oci_core_route_table" "theroutetable" {
  vcn_id = oci_core_vcn.thevcn.id
  compartment_id = oci_identity_compartment.thecompartment.id
  display_name = "happy-route-table"
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = "${oci_identity_compartment.thecompartment.compartment_id}"
}

output "availability_domains" {
  value = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

resource "oci_core_instance" "theinstance" {
  compartment_id = oci_identity_compartment.thecompartment.id
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  display_name = "happy-instance"
  shape = "VM.Standard2.1"
  source_details {
    source_type = "image"
    source_id = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaanjaxxq3fajfyhseoyqg3wa7lhhgksmta23rijslzse4q3h2fm2kq"
  }
  create_vnic_details {
    subnet_id = oci_core_subnet.thepublicsubnet.id
    assign_public_ip = true
  }
  metadata = {
    ssh_authorized_keys = file("C:/Users/moazi/Documents/public.pub")
  }
  preserve_boot_volume = false
}