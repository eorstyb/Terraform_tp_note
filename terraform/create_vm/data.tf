data "proxmox_virtual_environment_pool" "data_pool" {
  pool_id = var.pool-id
}

data "proxmox_virtual_environment_file" "ubuntu_iso" {
  node_name    = var.node-name
  datastore_id = var.datastore-id
  content_type = "iso"
  file_name    = var.iso-path
}

data "tls_public_key" "ssh_key" {
  private_key_openssh = file(var.private-ssh-key-path)
}