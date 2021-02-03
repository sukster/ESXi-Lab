1. Configure the live IP address of the host in the inventory.yml

2. Edit 01-netcfg.yaml under the resources directory and configure the static IP address for eth0 which can be reached from home network e.g.:

network:
  version: 2
  ethernets:
    eth0:
      dhcp4: true
      gateway4: 10.10.10.254
    eth1:
      dhcp4: true

Note: eth0 is on "VM Network" and eth1 is on "HostOnly Network". Also make sure to include the gateway4 parameter which refers to the default gateway

3. Review the default route being added under roles/ubuntu/tasks/main.yml and change it if needed or uncomment it

4. Review the NFS mount point and permissions under roles/ubuntu/tasks/main.yml and change them if needed or uncomment them

5. Download the OVF Tool from my.vmware.com, rename the file simply to "ovftool.bundle" and place it into the resources directory

6. Then from directory run:

ansible-playbook -vvv -i inventory.yml provisioner.yml

