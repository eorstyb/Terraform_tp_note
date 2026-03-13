resource "local_file" "ansible_inventory" {
  filename = "${path.module}/ansible/inventory.ini"

  content = <<EOT
[app]
${module.create_app.vm_name_out} ansible_host=${module.create_app.vm_ip_out}

[bdd]
${module.create_bdd.vm_name_out} ansible_host=${module.create_bdd.vm_ip_out}
EOT
}

resource "null_resource" "run_ansible" {
  # On attend que les VMs soient prêtes et l'inventaire écrit
  depends_on = [
    module.create_app,
    module.create_bdd,
    local_file.ansible_inventory
  ]

  provisioner "local-exec" {
    # On se déplace dans le dossier ansible et on lance le playbook
    command = "sleep 60 && cd ${path.module}/../ansible && ansible-playbook playbook.yml"
  }
}

module "create_app" {
  source     = "./create_vm"
  depends_on = [module.create_bdd]

  # Config Provider
  provider-username    = "ethan@pam"
  provider-password    = "Umc2bLpu"
  provider-endpoint    = "https://192.168.100.100:8006"
  provider-is-insecure = true

  # Config VM
  count-vm           = 1
  vm-name            = "cytech-ethan-app"
  node-name          = "proxmox2"
  pool-id            = "terraform"
  my-pool-id         = "ethan-pool"
  username           = "ethan"
  password           = "ethan"
  ram                = 1024
  core               = 1
  cpu-type           = "x86-64-v2-AES"
  core-type          = "x86-64-v2-AES"
  is-stop-on-destroy = true
  user-data-path     = "user-data.yaml"

  # Datastore
  datastore-name      = "local-lvm"
  datastore-interface = "virtio0"
  datastore-size      = 20
  datastore-id        = "local"
  iso-path            = "jammy-server-cloudimg-amd64.img"

  # Network
  bridge               = "vmbr0"
  gateway              = "192.168.100.1"
  public-ssh-key-path  = "~/.ssh/id_ed25519.pub"
  private-ssh-key-path = "~/.ssh/id_ed25519"
  ip-addresses         = ["192.168.100.134/24"]
  connection-type      = "ssh"
  timeout              = "5m"
  last-digits-ip       = 134
  default-id           = 1000
  ip-addresses-bdd     = "192.168.100.135"
  ip-addresses-app     = "192.168.100.134"
}

module "create_bdd" {
  source = "./create_vm"

  # Config Provider
  provider-username    = "ethan@pam"
  provider-password    = "Umc2bLpu"
  provider-endpoint    = "https://192.168.100.100:8006"
  provider-is-insecure = true

  # Config VM
  count-vm           = 1
  vm-name            = "cytech-ethan-bdd"
  node-name          = "proxmox2"
  pool-id            = "terraform"
  my-pool-id         = "ethan-pool"
  username           = "ethan"
  password           = "ethan"
  ram                = 2048
  core               = 1
  cpu-type           = "x86-64-v2-AES"
  core-type          = "x86-64-v2-AES"
  is-stop-on-destroy = true
  user-data-path     = "user-data.yaml"


  # Datastore
  datastore-name      = "local-lvm"
  datastore-interface = "virtio0"
  datastore-size      = 20
  datastore-id        = "local"
  iso-path            = "jammy-server-cloudimg-amd64.img"

  # Network
  bridge               = "vmbr0"
  gateway              = "192.168.100.1"
  public-ssh-key-path  = "~/.ssh/id_ed25519.pub"
  private-ssh-key-path = "~/.ssh/id_ed25519"
  ip-addresses         = ["192.168.100.135/24"]
  connection-type      = "ssh"
  timeout              = "5m"
  last-digits-ip       = 135
  default-id           = 1000
  ip-addresses-bdd     = "192.168.100.135"
  ip-addresses-app     = "192.168.100.134"
}