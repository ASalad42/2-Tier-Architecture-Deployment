
 # updating and upgrading ubuntu 
 sudo apt-get update -y 
 sudo apt-get upgrade -y

 # setting up nginx 
 sudo apt-get install nginx -y
 sudo systemctl start nginx 
 sudo systemctl enable nginx 
 

 # setting up nodejs 
 sudo apt-get purge nodejs npm  
 curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
 sudo apt-get install -y nodejs  

 # setting up npm 
 sudo npm install pm2 -g
 sudo apt-get update -y
 sudo apt-get upgrade -y

 # automate reverse proxy 
 sudo cp -f app/app/rp_file/etc/nginx/sites-available/default
 sudo systemctl restarst nginx 