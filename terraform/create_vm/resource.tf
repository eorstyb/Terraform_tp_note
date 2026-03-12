# resource "proxmox_virtual_environment_pool" "resource_pool_ethan" {
#   pool_id = var.my-pool-id
# }

resource "proxmox_virtual_environment_file" "cloud_config" {
  content_type = "snippets"
  datastore_id = var.datastore-id
  node_name    = var.node-name

  source_raw {
    data      = file(var.user-data-path)
    file_name = var.user-data-path
  }
}