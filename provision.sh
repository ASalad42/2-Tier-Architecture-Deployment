
 # updating and upgrading ubuntu 
 sudo apt-get update && sudo apt-get upgrade -y

 # setting up nginx 
 sudo apt-get install nginx 
 sudo systemctl enable nginx
 sudo systemctl start nginx 

 # setting up nodejs 
 sudo apt-get purge nodejs npm 
 curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
 sudo apt-get install -y nodejs

 # setting up npm (inside app folder where you have app.js)
 