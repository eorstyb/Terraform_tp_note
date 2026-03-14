# create_vm/output.tf

output "vm_name_out" {
  description = "VM Name :"
  value       = var.vm-name 
}

output "vm_ip_out" {
  description = "VM IP :"
  value       = split("/", var.ip-addresses[0])[0] 
}