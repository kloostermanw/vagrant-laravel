# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

current_dir    = File.dirname(File.expand_path(__FILE__))
configs        = YAML.load_file("#{current_dir}/ansible/group_vars/all")


Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = HOSTNAME
  config.vm.network "private_network", ip: vagrant_config['public_ip']

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  config.vm.synced_folder "ansible", "/vagrant"

  config.vm.synced_folder ".", "/var/www/vhosts/changeme", type: "nfs", mount_options: ['rw', 'vers=3', 'tcp', 'fsc']

  # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
  end

  config.vm.provision :shell, :inline => "sudo systemctl restart httpd", run: "always"
end
