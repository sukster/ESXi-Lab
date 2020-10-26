output "provisioner_interfaces" {
  value = esxi_guest.provisioner.network_interfaces
}

output "provisioner_ips" {
  value = esxi_guest.provisioner.ip_address
}
