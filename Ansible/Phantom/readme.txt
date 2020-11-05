1. You need to register a free account on my.phantom.us to download the community edition. The Ansible playbook will prompt you for the username and password.

2. Configure the live IP address of the host in the inventory.yml

3. Review the default route being added under roles/phantom/tasks/main.yml and change it if needed or uncomment it

4. Then from directory run:

ansible-playbook -vvv -i inventory.yml phantom.yml