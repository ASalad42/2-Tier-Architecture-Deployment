# Ruby

Vagrant.configure("2") do |config|
# creating a virtual machine ubuntu 
    
 config.vm.box = "ubuntu/xenial64"

 config.vm.network "private_network", ip: "192.168.10.100"
 config.vm.synced_folder ".", "/home/vagrant/app" 
 # sync data from local host 

 # other configuartion for provision file
 config.vm.provision "shell", path: "provision.sh"
 
end 
 

# once u add pn, you need to reboot VM - vagrant reload 
# if reload does not work try - vagrant destroy - then vag up

# syncing our app folder from local host to vm 

