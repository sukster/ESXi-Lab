output "cuckoo_interfaces" {
  value = esxi_guest.cuckoo.network_interfaces
}

output "provisioner_ips" {
  value = esxi_guest.cuckoo.ip_address
}
