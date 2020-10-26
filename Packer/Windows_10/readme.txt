1. Make sure you have updated the following from the official DetectionLab Repo's /Packer directory:
	- answer_files directory
	- floppy directory
	- scripts directory
	- update path to the latest Windows 10 image in the windows_10_esxi.json

2. Configure the variables in variables.json template. Leave the password variable empty.

3. From the directory run: packer build -var-file variables.json -var esxi_password=$my_esxi_password$ windows_10_esxi.json
