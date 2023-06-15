#!/bin/bash

wget  https://wordpress.org/wordpress-6.2.2.tar.gz  -O  wordpress-6.2.2.tar.gz
tar -xzvf  wordpress-6.2.2.tar.gz
ls -l
echo -e "\033[1;34mA new wordpress directory will be created with sample php files\033[0m"
sleep 10
echo -e "---------------------------------------------------------------------------------"
echo -e "\033[1;34mnstall docker and docker compose\033[0m"
chmod +x install-docker.sh
./install-docker.sh
echo -e "---------------------------------------------------------------------------------"

echo -e "\033[1;34mUser input for domain name\033[0m"

chmod +x usrinp.sh
./usrinp.sh

echo -e "---------------------------------------------------------------------------------"

echo -e "\033[1;34mMake directory for nginx\033[0m"
mkdir ./wordpress/nginx

echo -e "\033[1;31mcopy nginx config file to nginx folder\033[0m"
cp nginx.conf ./wordpress/nginx/nginx.conf

echo -e "---------------------------------------------------------------------------------"
echo -e "\033[1;34mEnter into wordpress directory\033[0m"
cd wordpress

echo -e "---------------------------------------------------------------------------------"

cat <<EOF > .env
MYSQL_ROOT_PASSWORD=demo_root_password
MYSQL_USER=demo_user
MYSQL_PASSWORD=demo_password
EOF

echo -e "---------------------------------------------------------------------------------"

echo -e "\033[1;34mCopy the dockerfile for php to wordpress folder\033[0m"
cp ../phpdockerfile .

echo -e "---------------------------------------------------------------------------------"

echo -e "\033[1;31mCopy the dockerfile-compose into current wordpress folder\033[0m"
cp ../docker-compose.yaml .

docker compose up -d --build

echo -e "\033[1;34myou will be redirected to the website\033[0m"
xdg-open http://localhost:80

while [[ $confirm != 'Y' ]];
do
    echo -e "Press \033[4;34mLet's Go \033[0mon the website\n"
    read -p "type Y to confirm: " confirm
done

while [[ $fill != 'Y' ]];
do
  echo -e "\033[1;30mDatabase Name\033[0m: wordpress\n \033[1;30mUsername\033[0m: demo_user\n \033[1;30mPassword\033[0m: demo_password\n \033[1;30mDatabase Host\033[0m: mysql"
  read -p "Have you clicked \"Submit\"? type Y to continue: " fill
done

while [[ $create != 'Y' ]];
do
  echo -e "\033[1;31mA new wordpress config file will be created in \"wordpress\" folder named as \"wp-config.php\" or \n simply copy paste the php cofiguration into the file and save it in wordpress folder\033[0m" 
  echo -e "\033[4;34mRun the installation\033[0m" 
read -p "Have you done it?(Y/N): " create
done

echo -e "\033[1;34mGive the necessary information and complete the installation process\033[0m"

echo -e "\*\* IT WILL OPEN UP THE WORDPRESS WEBSITE \*\*"
