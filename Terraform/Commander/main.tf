provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

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
  
  guest_name = "win10test"
  disk_store = "Local_NVMe (2)"
  guestos    = "windows9-64"

  boot_disk_type = "thin"

  memsize            = "2048"
  numvcpus           = "2"
  resource_pool_name = "/"
  power              = "on"
  clone_from_vm = "Windows10"
 
  network_interfaces {
    virtual_network = var.vm_network
    mac_address     = "00:50:56:a2:b1:c2"
    nic_type        = "e1000"
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