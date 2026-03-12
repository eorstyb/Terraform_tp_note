# Config Provider
provider-username = "ethan@pam"
provider-password = "Umc2bLpu"
provider-endpoint = "https://192.168.100.100:8006"
provider-is-insecure = true

# Config VM
count-vm             = 2
vm-name              = "ethan-vm"
node-name            = "proxmox2"
pool-id              = "terraform"
my-pool-id = "ethan-pool"
username             = "ethan"
password             = "ethan"
ram                  = 1024
core                 = 1
cpu-type             = "x86-64-v2-AES"
core-type            = "x86-64-v2-AES"
is-stop-on-destroy   = true

# Datastore
datastore-name       = "local-lvm"
datastore-interface  = "virtio0"
datastore-size       = 20
datastore-id = "local"
iso-path = "jammy-server-cloudimg-amd64.img"

# Network
bridge               = "vmbr0"
gateway              = "192.168.100.1"
public-ssh-key-path  = "~/.ssh/id_ed25519.pub"
private-ssh-key-path = "~/.ssh/id_ed25519"
ip-addresses          = ["192.168.100.134/24", "192.168.100.135/24"]
connection-type      = "ssh"
timeout              = "5m"
last-digits-ip       = 134
default-id           = 1000
ip-addresses-bdd = "192.168.100.135"
ip-addresses-app = "192.168.100.134"




