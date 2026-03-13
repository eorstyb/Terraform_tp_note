variable "vm-name" {
  type = string
}

variable "node-name" {
  type = string
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

variable "ram" {
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

variable "ip-addresses" {
  type = list(any)
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

variable "last-digits-ip" {
  type = number
}

variable "count-vm" {
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

variable "ip-addresses-bdd" {
  type = string
}

variable "ip-addresses-app" {
  type = string
}