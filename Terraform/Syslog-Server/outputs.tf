output "syslog-server_interfaces" {
  value = esxi_guest.syslog-server.network_interfaces
}

output "syslog-server_ips" {
  value = esxi_guest.syslog-server.ip_address
}
