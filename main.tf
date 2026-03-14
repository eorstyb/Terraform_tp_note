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
  depends_on = [
    module.create_app,
    module.create_bdd,
    local_file.ansible_inventory
  ]

  provisioner "local-exec" {
    command = "sleep 60 && cd ${path.module}/ansible && ansible-playbook playbook.yml"
  }
}

module "create_app" {
  source     = "./create_vm"
  depends_on = [module.create_bdd]

  # Config Provider
  provider-username    = var.provider-username
  provider-password    = var.provider-password
  provider-endpoint    = var.provider-endpoint
  provider-is-insecure = var.provider-is-insecure

  # Config VM
  count-vm           = var.app-count-vm
  vm-name            = var.app-vm-name
  node-name          = var.node-name
  pool-id            = var.pool-id
  my-pool-id         = var.my-pool-id
  username           = var.username
  password           = var.password
  ram                = var.ram-app
  core               = var.core
  cpu-type           = var.cpu-type
  core-type          = var.core-type
  is-stop-on-destroy = var.is-stop-on-destroy
  user-data-path     = var.user-data-path

  # Datastore
  datastore-name      = var.datastore-name
  datastore-interface = var.datastore-interface
  datastore-size      = var.datastore-size
  datastore-id        = var.datastore-id
  iso-path            = var.iso-path

  # Network
  bridge               = var.bridge
  gateway              = var.gateway
  public-ssh-key-path  = var.public-ssh-key-path
  private-ssh-key-path = var.private-ssh-key-path
  ip-addresses         = var.app-ip-addresses
  connection-type      = var.connection-type
  timeout              = var.timeout
  last-digits-ip       = var.app-last-digits-ip
  default-id           = var.default-id
}

module "create_bdd" {
  source = "./create_vm"

  # Config Provider
  provider-username    = var.provider-username
  provider-password    = var.provider-password
  provider-endpoint    = var.provider-endpoint
  provider-is-insecure = var.provider-is-insecure

  # Config VM
  count-vm           = var.bdd-count-vm
  vm-name            = var.bdd-vm-name
  node-name          = var.node-name
  pool-id            = var.pool-id
  my-pool-id         = var.my-pool-id
  username           = var.username
  password           = var.password
  ram                = var.ram-bdd
  core               = var.core
  cpu-type           = var.cpu-type
  core-type          = var.core-type
  is-stop-on-destroy = var.is-stop-on-destroy
  user-data-path     = var.user-data-path

  # Datastore
  datastore-name      = var.datastore-name
  datastore-interface = var.datastore-interface
  datastore-size      = var.datastore-size
  datastore-id        = var.datastore-id
  iso-path            = var.iso-path

  # Network
  bridge               = var.bridge
  gateway              = var.gateway
  public-ssh-key-path  = var.public-ssh-key-path
  private-ssh-key-path = var.private-ssh-key-path
  ip-addresses         = var.bdd-ip-addresses
  connection-type      = var.connection-type
  timeout              = var.timeout
  last-digits-ip       = var.bdd-last-digits-ip
  default-id           = var.default-id
}