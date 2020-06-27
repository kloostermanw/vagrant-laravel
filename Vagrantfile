# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

current_dir = File.dirname(File.expand_path(__FILE__))
ansible_config = YAML.load_file("#{current_dir}/ansible/group_vars/all")
project_path = ansible_config['basedir'] + '/' + ansible_config['project']

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = ansible_config['hostname']
  config.vm.network "private_network", ip: ansible_config['ipaddress']

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  config.vm.synced_folder "ansible", "/vagrant"

  config.vm.synced_folder ".", project_path, type: "nfs", mount_options: ['rw', 'vers=3', 'tcp', 'fsc']

  # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
  end

  config.vm.provision :shell, :inline => "sudo systemctl restart httpd", run: "always"
end
