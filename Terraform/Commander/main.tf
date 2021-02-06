resource "null_resource" "test" {

    provisioner "remote-exec" {
    inline = [
      "sudo mkdir /tmp/you123"
    ]

    connection {
      host        = "10.10.10.12"
      type        = "ssh"
      user        = "vagrant"
      password    = "vagrant"
    }
  }
}