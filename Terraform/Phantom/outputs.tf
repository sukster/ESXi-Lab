output "phantom_interfaces" {
  value = esxi_guest.phantom.network_interfaces
}

output "phantom_ips" {
  value = esxi_guest.phantom.ip_address
}
