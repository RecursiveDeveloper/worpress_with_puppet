puppet_exec="/opt/puppetlabs/bin/puppet"
manifest_path="/opt/Actividad_1/manifests/default.pp"
forge_modules_path="/etc/puppetlabs/code/environments/production/modules"
own_modules_path="/opt/Actividad_1/modules"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.boot_timeout = 480

  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "private_network", ip: "192.168.33.10"
  
  config.vm.synced_folder ".", "/opt/Actividad_1"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "Actividad_1"
    vb.cpus = 2
    vb.memory = "3072"
  end

  config.vm.provision "shell", path: "./provisioners/puppet_install.sh"
  config.vm.provision "shell", path: "./provisioners/puppet_install_modules.sh", 
    args: "#{puppet_exec}"
  config.vm.provision "shell", path: "./provisioners/puppet_copy_modules.sh", 
    args: "#{own_modules_path} #{forge_modules_path}"
  config.vm.provision "shell", path: "./provisioners/puppet_apply.sh", 
    args: "#{puppet_exec} #{manifest_path}"
end
