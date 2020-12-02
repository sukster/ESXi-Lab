#########################################
#  ESXI Provider host/login details
#########################################
#
#   Use of variables here to hide/move the variables to a separate file
#
provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

#########################################
#  ESXI Guest resource
#########################################
resource "esxi_guest" "demisto" {
  guest_name = "Demisto"
  disk_store = "Local_NVMe"
  guestos    = "ubuntu-64"

  boot_disk_type = "thin"
  boot_disk_size = "35"

  memsize            = "4000"
  numvcpus           = "4"
  resource_pool_name = "/"
  power              = "on"
  clone_from_vm = "Ubuntu1804"

    provisioner "remote-exec" {
    inline = [
      "sudo ifconfig eth0 up",
      "sudo ifconfig eth1 up",
      "sudo dhclient eth1",
      "sudo route add default gw 192.168.2.254"
    ]

    connection {
      host        = self.ip_address
      type        = "ssh"
      user        = "vagrant"
      password    = "vagrant"
    }
  }
  # This is the network that bridges your host machine with the ESXi VM
  # If this interface doesn't provide connectivity, you will have to uncomment
  # the interface below and add a virtual network that does
  network_interfaces {
    virtual_network = var.vm_network
#    mac_address     = "00:50:56:a3:b1:c2"
    nic_type        = "vmxnet3"
  }
  # This is the local network that will be used for 192.168.38.x addressing
  network_interfaces {
    virtual_network = var.hostonly_network
#    mac_address     = "00:50:56:a3:b1:c4"
    nic_type        = "vmxnet3"
  }
  # OPTIONAL: Uncomment out this interface stanza if your vm_network doesn't 
  # provide internet access
  # network_interfaces {
  #  virtual_network = var.nat_network
  #  mac_address     = "00:50:56:a3:b1:c3"
  #  nic_type        = "vmxnet3"
  # }
  guest_startup_timeout  = 45
  guest_shutdown_timeout = 30
}
