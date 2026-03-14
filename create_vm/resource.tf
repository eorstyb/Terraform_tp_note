# resource "proxmox_virtual_environment_pool" "resource_pool_ethan" {
#   pool_id = var.my-pool-id
# }

# get user data
resource "proxmox_virtual_environment_file" "cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.node-name

  source_raw {
    data = templatefile("user-data.yaml", {
      username = var.username
      ssh_key  = trimspace(file(var.public-ssh-key-path))
    })
    file_name = "${var.vm-name}-config.yaml"
  }
}