output "connexion_info" {
  value = <<EOT

============================================================
ACHÈVEMENT DU DÉPLOIEMENT
============================================================
Application disponible sur : http://${split("/", var.ip-addresses-app)[0]}:8080
Commande SSH App : ssh ${var.username}@${split("/", var.ip-addresses-app)[0]}
Commande SSH BDD : ssh ${var.username}@${split("/", var.ip-addresses-bdd)[0]}
============================================================
EOT
}

output "vm_name_out" {
  value = proxmox_virtual_environment_vm.ubuntu_vm[0].name
}

# On en profite pour sortir l'IP aussi, c'est plus propre
output "vm_ip_out" {
  value = split("/", proxmox_virtual_environment_vm.ubuntu_vm[0].initialization[0].ip_config[0].ipv4[0].address)[0]
}