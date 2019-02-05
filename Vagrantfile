# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
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
    default.vm.provision :shell, :path => "devroot/scripts/vagrant/provision.sh"
  end

  config.vm.define "bundled", autostart: false do |bundled|
    bundled.vm.box = "c360-devbox-3.0.0.box"
    bundled.vm.box_url = "ftp://vagrant:SwVv5JpY4uY2G74X@vault.edrnet.com/vagrant/c360/3.0.0/c360-devbox-3.0.0.box"
  end

  config.vm.define "32bit", autostart: false do |box32|
    box32.vm.box = "bento/ubuntu-16.04-i386"
    box32.vm.box_version = "2.2.9"
    box32.vm.provision :shell, :path => "devroot/scripts/vagrant/provision.sh"

    config.vm.provider "virtualbox" do |vb|
      vb.cpus = 1
    end
  end

  config.vm.synced_folder ".", "/vagrant", type: "nfs"
  config.vm.network :private_network, ip: ENV['IP'] ||= "192.168.3.11"
  config.vm.network :forwarded_port, guest: 3306, host: 3306
  config.vm.hostname = "branch.collateral360.com"
  config.hostsupdater.aliases = ["branch.collateral360.com","static-branch.collateral360.com"]
end
