1. Configure the live IP address of the host in the inventory.yml

2. Edit 01-netcfg.yaml under the resources directory and configure it as needed e.g.:

network:
  version: 2
  ethernets:
    eth0:
      dhcp4: true
    eth1:
      dhcp4: false
      addresses: [192.168.38.105/24]

Note: eth0 is on "VM Network" and eth1 is on "HostOnly Network"

3. Review the default route being added under roles/ubuntu/tasks/main.yml and change it if needed or uncomment it

4. Review the NFS mount point and permissions under roles/ubuntu/tasks/main.yml and change them if needed or uncomment them

5. Download the OVF Tool from my.vmware.com, rename the file simply to "ovftool.bundle" and place it into the resources directory

6. Then from directory run:

ansible-playbook -vvv -i inventory.yml provisioner.yml

