1. Make sure you have updated the following from the official DetectionLab Repo's /ESXi/Packer directory:
	- _common directory
	- http directory
	- scripts directory
	- update path to the latest Centos 7 image in the centos78_esxi.json

2. Configure the variables in variables.json template. Leave the password variable empty

3. If output-vmware-iso directory exists, make sure you delete it before running packer build

4. From the directory run: packer build -var-file variables.json -var esxi_password=$my_esxi_password$ centos78_esxi.json
