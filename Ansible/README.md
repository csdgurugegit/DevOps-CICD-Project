# Manage and Configure Infrastructure Nodes Using Ansible

This Repository is created to manage and configure infrastructure nodes using Ansible. All the bash scripts and YAML files needed are located in the 'scripts' directory. To setup Ansible, follow the instructions provided below.

## Setup Ansible

Install ansible on Ubuntu.

```
sudo apt update
sudo apt install ansible -y
```

Generate a public key and a private key for use within Ansible. If you want more security, you can use a passphrase with your key.

```
ssh-keygen -t ed25519 -C "ansible"
```

Add the SSH public key to the Ubuntu nodes.

```
ssh-copy-id -i ~/.ssh/ansible.pub root@192.168.1.4
```

Use this command to log in to Ubuntu node.

```
ssh -i ~/.ssh/ansible 192.168.1.4
```

Create ansible.cfg file and inventory file.

The ansible.cfg file configures ansible's settings, while the inventory file specifies the hosts ansible will manage.

**ansible.cfg** file

```
[defaults]
inventory = inventory
private_key_file = ~/.ssh/ansible
```

**inventory** file with Host groups

```
[k8_master_node]
192.168.1.4

[k8_worker_node]
192.168.1.5

[jenkins_node]
192.168.2.4

[sonarqube_node]
192.168.2.5

[ansible_node]
192.168.2.6
```

## Run Ansible-Playbook

Ansible-Playbook commad.

```
cd ./jenkins-playbook/
ansible-playbook --ask-become-pass copy-scripts.yml

OR

ansible-playbook copy-scripts.yml
```


