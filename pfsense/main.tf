resource "oci_core_instance" "pfsense" {
  availability_domain = "wbka:US-ASHBURN-AD-1"
  compartment_id      = var.compartment_ocid
  display_name        = "PFSense Instance"
  shape               = var.instance_shape

  create_vnic_details {
    display_name           = "main-vnic"
    subnet_id              = var.subnet_ocid
    private_ip             = var.priv_ip
    assign_public_ip      = false
    skip_source_dest_check = false
  }
  shape_config {
    memory_in_gbs = 8
    ocpus         = 2
  }
  source_details {
    source_type = "image"
    source_id   = var.image_id
    boot_volume_size_in_gbs = 1100
  }
  metadata = {
    ssh_authorized_keys = file("ssh-key-2021-03-12.key.pub")
  }
  preserve_boot_volume = false
}

