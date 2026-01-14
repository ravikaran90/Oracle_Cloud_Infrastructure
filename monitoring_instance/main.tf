resource "oci_core_subnet" "monitoring_subnet" {
  compartment_id = var.compartment_ocid
  vcn_id         = var.vcn_ocid
  cidr_block     = "10.1.1.0/28"
  display_name   = "Monitoring Subnet"
  prohibit_internet_ingress = true
}

resource "oci_core_instance" "monitoring_instance" {
  availability_domain = "wbka:US-ASHBURN-AD-1"
  compartment_id      = var.compartment_ocid
  display_name        = "Monitoring Instance"
  shape               = var.instance_shape

  create_vnic_details {
    display_name           = "main-vnic"
    subnet_id              = var.subnet_ocid
    private_ip             = "10.1.1.12"
    assign_public_ip       = false
    skip_source_dest_check = false
  }
  shape_config {
    memory_in_gbs = 8
    ocpus         = 4
  }
  source_details {
    source_type = "image"
    source_id   = var.image_id
    boot_volume_size_in_gbs = 50
  }
  metadata = {
    ssh_authorized_keys = file("ssh-key-2022-12-05.key.pub")
  }
  preserve_boot_volume = false
}
