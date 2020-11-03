1. Configure the variables in variables.tf template. Leave the password variable empty.

2. Configure the guest_name, disk_store, numvcpus, memsize, etc. in the main.tf template.

3. If needed configure the interface MAC addresses manually in the main.tf

4. From the directory run: terraform init && terraform apply
