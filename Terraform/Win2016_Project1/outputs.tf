output "win2016srv1_interfaces" {
  value = esxi_guest.win2016srv1.network_interfaces
}

output "win2016srv1_ips" {
  value = esxi_guest.win2016srv1.ip_address
}