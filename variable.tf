variable "node-name" {
  type = string
}

variable "app-count-vm" {
  type = number
}

variable "bdd-count-vm" {
  type = number
}

variable "pool-id" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "public-ssh-key-path" {
  type = string
}

variable "private-ssh-key-path" {
  type = string
}

variable "ram-app" {
  type = number
}

variable "ram-bdd" {
  type = number
}

variable "bridge" {
  type = string
}

variable "gateway" {
  type = string
}

variable "core" {
  type = number
}

variable "cpu-type" {
  type = string
}

variable "core-type" {
  type = string
}

variable "datastore-name" {
  type = string
}

variable "datastore-interface" {
  type = string
}

variable "datastore-size" {
  type = number
}

variable "connection-type" {
  type = string
}

variable "timeout" {
  type = string
}

variable "default-id" {
  type = number
}

variable "is-stop-on-destroy" {
  type = bool
}

variable "my-pool-id" {
  type = string
}

variable "datastore-id" {
  type = string
}

variable "iso-path" {
  type = string
}

variable "provider-username" {
  type = string
}

variable "provider-password" {
  type = string
}

variable "provider-endpoint" {
  type = string
}

variable "provider-is-insecure" {
  type = bool
}

variable "bdd-vm-name" {
  type = string
}

variable "app-vm-name" {
  type = string
} 

variable "user-data-path" {
  type        = string
}

variable  "app-ip-addresses" {
  type        = list(any)
}

variable  "bdd-ip-addresses" {
  type        = list(any)
}

variable  "app-last-digits-ip" {
  type        = string
}

variable  "bdd-last-digits-ip" {
  type        = string
}

