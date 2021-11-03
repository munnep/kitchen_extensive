# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.hostname = "kitchen"
  
  config.vm.provision "shell", path: "install_kitchen.sh"
  config.vm.provision "shell", path: "install_terraform.sh"
  config.vm.provision "shell", path: "install_aws-cli.sh"
  config.vm.provision "shell", path: "install_jq.sh"
  config.vm.provision "shell", path: "setup_kitchen.sh", privileged: false
  config.vm.provision "shell", path: "setup_ssh_key.sh", privileged: false

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024*2
    v.cpus = 2
  end

end
