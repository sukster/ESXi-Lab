1. You need to register a for a free community edition of Demisto at https://start.paloaltonetworks.com/sign-up-for-community-edition.html. Ansible will prompt you for a direct download link which can be found on the Demisto download page.

2. Configure the live IP address of the host in the inventory.yml

3. Then from directory run:

ansible-playbook -vvv -i inventory.yml demisto.yml