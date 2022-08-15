

 sudo apt-get update && sudo apt-get uprgade -y
 sudo apt-get install nginx 
 sudo systemctl enable nginx
 sudo systemctl start nginx 

 sudo apt-get purge nodejs npm 
 curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
 sudo apt-get install -y nodejs

 cd app
 cd app
 sudo npm install pm2 -y
 npm install express -y 
 npm start -y 