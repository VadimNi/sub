apt-get update && apt-get install -y nginx mc curl python3-pip git mysql-server mysql-client &&
apt-get install -y python3-dev libmysqlclient-dev && 
pip3 install django==1.10.5 &&
pip3 install gunicorn==19.6.0 &&
pip3 install mysqlclient &&
rm /etc/nginx/sites-available/default && 
ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-available/default &&
/etc/init.d/nginx restart &&
/etc/init.d/mysql start &&
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS my_db CHARACTER SET utf8;" &&
mysql -uroot -e "create user 'user'@'localhost' identified by '12345';" &&
mysql -uroot -e "GRANT ALL PRIVILEGES ON * . * TO 'user'@'localhost';" &&
cd /home/box/web 