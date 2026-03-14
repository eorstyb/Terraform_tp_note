resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  count     = var.count-vm
  name      = var.vm-name
  node_name = var.node-name
  # pool_id         = proxmox_virtual_environment_pool.resource_pool_ethan.id
  vm_id           = var.default-id + var.last-digits-ip + count.index
  stop_on_destroy = var.is-stop-on-destroy

  agent {
    enabled = true
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.ip-addresses[count.index]
        gateway = var.gateway
      }
    }
    user_data_file_id = proxmox_virtual_environment_file.cloud_config.id
  }

  cpu {
    cores = var.core
    type  = var.cpu-type
  }

  disk {
    datastore_id = var.datastore-name
    interface    = var.datastore-interface
    size         = var.datastore-size
    file_id      = data.proxmox_virtual_environment_file.ubuntu_iso.id
  }

  memory {
    dedicated = var.ram
    floating  = var.ram
  }


  network_device {
    bridge = var.bridge
  }

  connection {
    type        = var.connection-type
    user        = var.username
    password    = var.password
    private_key = file(var.private-ssh-key-path)
    host        = var.ip-addresses[count.index]
    timeout     = var.timeout
  }

  provisioner "local-exec" {
    command = "echo 'VM ${self.name} : ${self.initialization[0].ip_config[0].ipv4[0].address}' >> vms_ips.txt"
  }
}