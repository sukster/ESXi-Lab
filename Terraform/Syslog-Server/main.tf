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
resource "esxi_guest" "syslog-server" {
  guest_name = "Syslog-Server"
  disk_store = "Local_NVMe"
  guestos    = "ubuntu-64"

  boot_disk_type = "thin"
  boot_disk_size = "35"

  memsize            = "8192"
  numvcpus           = "4"
  resource_pool_name = "/"
  power              = "on"
  clone_from_vm = "Ubuntu1804"

    provisioner "remote-exec" {
    inline = [
      "sudo ifconfig eth0 up"
    ]

    connection {
      host        = self.ip_address
      type        = "ssh"
      user        = "vagrant"
      password    = "vagrant"
    }
  }

  network_interfaces {
    virtual_network = var.vm_network
    nic_type        = "vmxnet3"
  }

  guest_startup_timeout  = 45
  guest_shutdown_timeout = 30
}
