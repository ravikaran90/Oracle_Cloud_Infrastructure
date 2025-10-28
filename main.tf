resource "oci_core_vcn" "canterbury_vcn"{
    compartment_id="00dd.1123.."
    cidr_block=["25.0.0.0/24"]
    display_name="canterbury vcn"
    dns_label="canterbury"
}