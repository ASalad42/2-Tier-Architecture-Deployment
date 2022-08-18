# Ruby

Vagrant.configure("2") do |config| 
# creating a virtual machine ubuntu 

    config.vm.define "db" do |db| # creates vm db
        db.vm.box = "ubuntu/bionic64" # setting up linux os 
        db.vm.network "private_network",  ip: "192.168.10.150" # network setup for nginx web server for db machine
        db.vm.provision "shell", path: "provisiondb.sh" #initially tried file path when file was else where, now using current directoy where vagrantfile is 
    end 

    config.vm.define "app" do |app| # creates vm app
        app.vm.box = "ubuntu/bionic64" # setting up linux os 
        app.vm.network "private_network",  ip: "192.168.10.100" # network setup for nginx web server for app machine 
        app.vm.synced_folder ".", "/home/vagrant/app" # sync data from local host 
        app.vm.provision "shell", path: "provision.sh" # shell provisioner for script and location path 
    end

    
end 







 #config.vm.box = "ubuntu/xenial64"
 #config.vm.network "private_network", ip: "192.168.10.100"
 #config.vm.synced_folder ".", "/home/vagrant/app" 
 
 # other configuartion for provision file
 #config.vm.provision "shell", path: "provision.sh"
# once u add pn, you need to reboot VM - vagrant reload 
# if reload does not work try - vagrant destroy - then vag up
# syncing our app folder from local host to vm 

