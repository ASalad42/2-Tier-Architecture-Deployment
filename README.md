<div align="center">
  
# Deployment
  
  </div>

- A monolithic architecture is a traditional model of a software program, which is built as a unified unit that is self-contained and independent from other applications. 
- A monolithic architecture is a singular, large computing network with one code base that couples all of the business concerns together.

<div align="center">

![image](https://user-images.githubusercontent.com/104793540/184662301-6b35e0b3-bdd6-4bf9-a501-b956b4c4a22b.png)
  </div>

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

```
# updating and upgrading ubuntu 
 sudo apt-get update -y
 sudo apt-get upgrade -y

 # setting up nginx 
 sudo apt-get install nginx 
 sudo systemctl enable nginx
 sudo systemctl start nginx 

 # setting up nodejs 
 sudo apt-get purge nodejs npm 
 curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
 sudo apt-get install -y nodejs

 # setting up npm 
 sudo npm install pm2 -g
 sudo apt-get update -y
 sudo apt-get upgrade -y

 # setting up npm (inside app folder where you have app.js)
 cd app
 cd app
 npm install express -y 
 npm start -y 

```

- vagrant up/ vagrant provision
<div align="center">

![image](https://user-images.githubusercontent.com/104793540/184724237-c05b5345-97bb-4682-97f6-f29dcda3afeb.png)

![image](https://user-images.githubusercontent.com/104793540/184724374-8be65faa-1de0-489c-b2be-0685519a381f.png)

![image](https://user-images.githubusercontent.com/104793540/184724413-32912e77-23b8-463d-9699-d6076d5a1c53.png)

  </div>

- taking npm out of script 


```
 cd app 
 npm install express -y 
 npm install mongoose
 npm start -y 
 ```
 
 ![2](https://user-images.githubusercontent.com/104793540/184834037-ca125a05-de9a-4c41-a872-c59d82e709c8.PNG)
 
 ![1](https://user-images.githubusercontent.com/104793540/184833993-99257cae-e65c-4185-899e-cb064dd938e2.PNG)


![3](https://user-images.githubusercontent.com/104793540/184834077-8df26c13-678c-4be8-982c-7393b3351587.PNG)

 ![image](https://user-images.githubusercontent.com/104793540/184833959-ff9d5fc8-b812-4838-bd8e-eb1da6e9b69e.png)


`sudo apt-get update && sudo apt-get install yarn` 
`nohup node app.js > /dev/null 2>&1 &`
use this command to run node app in the background 

`export` command `export Last_Name`
check spec Env var `printenv Last_Name`
`echo $Name`


#### how to make Env Variable `PERSISTENT`
- research how to make env persistent of your first_name, last_name, `DB_HOST=mongodb://192.168.10.150:27017/posts`
`ls -a`
`sudo nano .bashrc` #add var you want to keep here 

### Setting Up Nginx as a Reverse Proxy Server
Now that your application is running, and listening on localhost, you need to set up a way for your users to access it. We will set up the Nginx web server as a reverse proxy for this purpose.

steps:
- in vagrant home `cd /etc `
- `ls `
- `cd nginx `
- `cd sites-available `
- `sudo nano default`
- inside the server block you should have an existing location / block. Replace the contents of that block with the following configuration. 
`location / {
      proxy_pass http://localhost:8080;`
- If your application is set to listen on a different port, update the litsening port to the correct port number i.e 3000
- Once you are done adding the location blocks for your applications, save and exit.
Make sure you didn’t introduce any syntax errors by typing:
- `sudo nginx -t `
- Restart Nginx with `sudo systemctl restart nginx`


### Multi-Machine 
Step 1 - Vagrant file 
- In the vagrant file two machines will be created called app abd db
- the machines will be running in parrallel 
```ruby 
# Ruby

Vagrant.configure("2") do |config| 
# creating a virtual machine ubuntu 
# 
    config.vm.define "app" do |app| # creates vm app
        app.vm.box = "ubuntu/bionic64" # setting up linux os 
        app.vm.network "private_network",  ip: "192.168.10.100" # network setup for nginx web server for app machine 
        app.vm.synced_folder ".", "/home/vagrant/app" # sync data from local host 
        app.vm.provision "shell", path: "provision.sh" # shell provisioner for script and location path 
    end

    config.vm.define "db" do |db| # creates vm db
        db.vm.box = "ubuntu/bionic64" # setting up linux os 
        db.vm.network "private_network",  ip: "192.168.10.150" # network setup for nginx web server for db machine
    end 
end 

```
