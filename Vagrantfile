# Vagrantfile API/syntax version
# This Vagrant file creates an Ubuntu 16.04 instance with PHP 7.2, and Apache web server
# Please refer to provision.sh file for more details.
# The environment is availanble at http://phpdevbox.test.com or http://localhost:1234
# Support with dnorena99@gmail.com

VAGRANTFILE_API_VERSION = "2"

required_plugins = %w( vagrant-hostsupdater )
required_plugins.each do |plugin|
  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = "2048"
    vb.gui = false
  end

  config.vm.define "default", primary: true do |default|
    default.vm.box = "bento/ubuntu-16.04"
    default.vm.box_version = "2.3.1"
    default.vm.provision :shell, :path => "part1/provision.sh"
  end

  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
  config.vm.network "forwarded_port", guest: 80, host: 1234
  config.vm.hostname = "phpdevbox.test.com"
  config.vm.network :private_network, ip: "192.168.3.11"
  config.hostsupdater.aliases = ["phpdevbox.test.com"]
  # copy index page
  config.vm.provision :file, source: 'part1/IndexST.html', destination: "IndexST.html"
  
end
