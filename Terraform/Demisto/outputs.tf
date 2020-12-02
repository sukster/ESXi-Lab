output "demisto_interfaces" {
  value = esxi_guest.demisto.network_interfaces
}

output "demisto_ips" {
  value = esxi_guest.demisto.ip_address
}
