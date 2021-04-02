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

resource "null_resource" "deactivate_vcenter" {

    provisioner "remote-exec" {
    inline = [
      "/etc/init.d/vpxa stop",
      "/etc/init.d/hostd restart",
      "sleep 30"
    ]

    connection {
      host        = var.esxi_hostname
      type        = "ssh"
      user        = var.esxi_username
      password    = var.esxi_password
    }
  }
}

resource "esxi_guest" "win10" {
  depends_on = [null_resource.deactivate_vcenter]
  guest_name = "win10"
  disk_store = "Local_NVMe (2)"
  guestos    = "windows9-64"

  boot_disk_type = "thin"
  boot_disk_size = "35"

  memsize            = "4096"
  numvcpus           = "2"
  resource_pool_name = "/"
  power              = "on"
  clone_from_vm = "Windows10"
  # This is the network that bridges your host machine with the ESXi VM
  network_interfaces {
    virtual_network = var.vm_network
 #   mac_address     = "00:50:56:a2:b1:c2"
    nic_type        = "vmxnet3"
  }
  # This is the local network that will be used for 192.168.38.x addressing
  network_interfaces {
    virtual_network = var.hostonly_network
 #   mac_address     = "00:50:56:a2:b1:c4"
    nic_type        = "vmxnet3"
  }
  guest_startup_timeout  = 45
  guest_shutdown_timeout = 30
}

resource "null_resource" "activate_vcenter" {
    
    depends_on = [esxi_guest.win10]

    provisioner "remote-exec" {
    inline = [
      "/etc/init.d/vpxa start"
    ]

    connection {
      host        = var.esxi_hostname
      type        = "ssh"
      user        = var.esxi_username
      password    = var.esxi_password
    }
  }
}