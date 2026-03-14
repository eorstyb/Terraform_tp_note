terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.98.1"
    }
  }
}


provider "proxmox" {
  username = var.provider-username
  password = var.provider-password
  endpoint = var.provider-endpoint
  insecure = var.provider-is-insecure
}