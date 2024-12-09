# availability domains
data "oci_identity_availability_domains" "theavailabilitydomains" {
  compartment_id = oci_identity_compartment.thecompartment.id
}