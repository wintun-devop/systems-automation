#create inventory to add remote hosts

#create ansible.cfg to add public key

#key file parameter do not need after ansible.cfg has been configured
ansible all -i inventory -m ping 

#fetch remote hosts data
ansible all -i inventory -m gather_facts

#fetch single remote host data
ansible all -i inventory -m gather_facts --limit HOST_IP_ADDRESS

#updte remote host(ubuntus)-we need to run sudo(--become --ask-become-pass)
ansible all -m apt -i inventory -a update_cache=true --become --ask-become-

#install a software package to remote hosts-we need to run sudo(--become --ask-become-pass)
ansible all -m apt -i inventory -a name=mc --become --ask-become-pass

#install a software package specific version to remote hosts-we need to run sudo(--become --ask-become-pass)
ansible all -m apt -i inventory -a "name=snapd state=latest" --become --ask-become-pass
