
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

 # automate reverse proxy and mongod
 sudo cp -f app/app/rp_file /etc/nginx/sites-available/default
 sudo systemctl restart nginx 
 sudo systemctl enable nginx 


 sudo echo "export DB_HOST=mongodb://192.168.10.150:27017/posts" >> /etc/.bashrc # print(echo) the dbhost connecttion into the .bashrc file 
 source /etc/.bashrc # use this source command if you want to apply the changes during the current session
 
#To set permanent environment variables for all users, create an .sh file in the /etc/profile.d folder: `sudo nano /etc/profile.d/[filename].sh`?????

 
 cd app
 cd app
 sudo apt-get install npm -y # solution on stackoverflow 
 npm install express -y
 npm install mongoose -y
 cd seeds
 node seed.js
 cd ..
 npm install
 npm start -d # detached, still have control of the terminal 
