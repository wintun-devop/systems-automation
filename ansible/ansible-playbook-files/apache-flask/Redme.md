#installing apache to remote hosts by ansible playbook
ansible-playbook --ask-become-pass -i inventory install_apache_ubuntu20.04lts.yaml

#remove apache to remote hosts by ansible playbook
ansible-playbook --ask-become-pass -i inventory remove_apache_ubuntu20.04lts.yaml