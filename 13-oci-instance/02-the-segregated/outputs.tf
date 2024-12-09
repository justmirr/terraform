# subnet
output "thesubnetoutput" {
    value = [oci_core_subnet.thepublicsubnet.id, oci_core_subnet.thepublicsubnet.display_name]
}

# availability domains
output "theavailabilitydomains" {
  value = data.oci_identity_availability_domains.theavailabilitydomains
}
