output "viper_interfaces" {
  value = esxi_guest.viper.network_interfaces
}

output "viper_ips" {
  value = esxi_guest.viper.ip_address
}
