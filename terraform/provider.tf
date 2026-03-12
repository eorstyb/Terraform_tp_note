terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.98.1"
    }
  }
}


provider "proxmox" {
  username = "ethan@pam"
  password = "Umc2bLpu"
  endpoint = "https://192.168.100.100:8006"
  insecure = true
}