# Deployment

- A monolithic architecture is a traditional model of a software program, which is built as a unified unit that is self-contained and independent from other applications. 
- A monolithic architecture is a singular, large computing network with one code base that couples all of the business concerns together.

![image](https://user-images.githubusercontent.com/104793540/184662301-6b35e0b3-bdd6-4bf9-a501-b956b4c4a22b.png)


### Shell Provisioner
Provisioner name: `"shell"`
- The Vagrant Shell provisioner allows you to upload and execute a script within the guest machine.
- Shell provisioning is ideal for users new to Vagrant who want to get up and running quickly and provides a strong alternative for users who are not comfortable with a full configuration management system such as Chef or Puppet.

https://www.vagrantup.com/docs/provisioning/shell#inline-scripts

The shell provisioner takes various options. One of inline or path is required:

- inline (string) - Specifies a shell command inline to execute on the remote machine. See the inline scripts section below for more information.

- path (string) - Path to a shell script to upload and execute. It can be a script relative to the project Vagrantfile or a remote script (like a gist).


### External scripts  (path)
The shell provisioner can also take an option specifying a path to a shell script on the host machine. Vagrant will then upload this script into the guest and execute it. An example:

```ruby
Vagrant.configure("2") do |config|
  config.vm.provision "shell", path: "script.sh"
end
Copy
```
Relative paths, such as above, are expanded relative to the location of the root Vagrantfile for your project.


### Task 

- Make new driectory or clone down from Github 
- create vagrantfile 

```ruby 
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

```

- create provision file (ensuring in same location of the root Vagrantfile for your project if using path method) 