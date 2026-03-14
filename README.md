# Projet Terraform / Ansible

Ce projet permet de déployer de manière entièrement automatisée une architecture web composée d'un serveur applicatif **Flask** et d'un serveur de base de données **PostgreSQL** sur un cluster **Proxmox**.

## ⚙️ Configuration

Pour des raisons de sécurité, les fichiers contenant des informations sensibles ne sont pas suivis par Git. Vous devez les créer à partir des exemples fournis.

### 1. Terraform (`terraform.tfvars`)

Ce fichier contient les variables spécifiques à votre infrastructure Proxmox. Créez un fichier `terraform.tfvars` à la racine du dossier `terraform/`.

| Variable | Description |
| --- | --- |
| `provider-username` | Nom d'utilisateur de votre compte Proxmox. |
| `provider-password` | Password de votre compte Proxmox. |
| `provider-endpoint` | Adresse API de votre serveur Proxmox. |
| `password` | Password des VM |
| `gateway` | Adresse IP du gateway. |
| `app-ip-addresses` | Adresse IP pour la VM App. |
| `bdd-ip-addresses` | Adresse IP pour la VM BDD. |
| `public-ssh-key-path` | Chemin vers votre clé SSH publique. |
| `private-ssh-key-path` | Chemin vers votre clé SSH privée. |

### 2. Ansible (`group_vars/all.yml`)

Ce fichier centralise la configuration logicielle et les identifiants de la base de données.

* **PostgreSQL** : Définit le nom de la base (`db_name`), l'utilisateur (`db_user`) et son mot de passe (`db_password`).
* **Adresses IP** : Définit les adresses IP (`app_ip`) et (`bdd_ip`).


### 3. Inventaire dynamique (`inventory.ini`)

Il suffit de rentrer les adresses IP des app et bdd.

```ini
[app]
cytech-ethan-app ansible_host=10.0.0.1 ansible_user=ethan

[bdd]
cytech-ethan-bdd ansible_host=10.0.0.2 ansible_user=ethan

```

---

## 🚀 Lancement

### Pré-requis

* Terraform installé.
* Ansible installé sur la machine de contrôle.
* Une image Cloud-init Ubuntu (Jammy) présente sur votre stockage Proxmox.

### Déploiement

1. **Initialisation** :
```bash
terraform init

```


2. **Déploiement** :
```bash
terraform apply -auto-approve

```

*Cette commande va créer les VMs, générer l'inventaire et lancer automatiquement le playbook Ansible*