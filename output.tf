output "connexion_info" {
  description = "Informations pratiques pour se connecter à l'infrastructure"
  value = <<EOT

=======================================================
            DÉPLOIEMENT TERMINÉ AVEC SUCCÈS !
=======================================================
Application disponible sur : http://${split("/", var.app-ip-addresses[0])[0]}:8080

Commande SSH App : ssh ${var.username}@${split("/", var.app-ip-addresses[0])[0]}
Commande SSH BDD : ssh ${var.username}@${split("/", var.bdd-ip-addresses[0])[0]}
=======================================================
EOT
}