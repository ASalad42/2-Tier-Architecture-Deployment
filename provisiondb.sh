# Mongod
 sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
 echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
 sudo apt-get update -y 
 sudo apt-get upgrade -y
 sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 
 
 sudo rm /etc/mongod.conf
 # explain
 sudo ln -s /app/mongod.conf /etc/mongod.conf
 # explain 
 #sudo cp -f C:\Users\Ayan\deployment\app\mongod.conf /etc/mongod.conf

 sudo systemctl restart mongod
 sudo systemctl enable  mongod
 sudo systemctl status  mongod

 