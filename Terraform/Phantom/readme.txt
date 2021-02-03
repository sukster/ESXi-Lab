1. Configure the variables in variables.tf template. Leave the password variable empty.

2. Configure the guest_name, disk_store, numvcpus, memsize, etc. in the main.tf template.

3. If needed configure the interface MAC addresses manually in the main.tf

4. SSH into the ESXi server and run these commands to disconnect the host from the vCenter:
/etc/init.d/vpxa stop
/etc/init.d/hostd restart

5. From the directory run: terraform init && terraform apply

6. Once the terrafrom is complete, run this command in ESXi server to reconnect it with the vCenter:
/etc/init.d/vpxa start