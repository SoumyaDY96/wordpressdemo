# wordpressdemo
This is a repository for Wordpress project. 

The current project is done using docker compose and LEMP (Linux, NGINX, MySQL and PHP) 
stack on Ubuntu. 

"install-docker.sh" file is used to install newer version of docker and docker compose along with their corresponding 
plugins.

"usrinp.sh" file is used to get domain name from the user which will be used to open up the website.

"docker-compose.yaml" is the main compose file to create the respective containers.

"phpdockerfile" is used to install more extensions on the base image of php:7.4-fpm-alpine.

"main_script_wordpress.sh" is the main script which should be run from the server. 
Download all the files to a specific folder and run this main script.

The other files and necessary commands will run from within the main script.

Make sure to change execute permission for "main_script_wordpress.sh" using:
``` chmod u+x "main_script_wordpress.sh" ```

The website will run on port 80

It is possible that "wp-cofig.php" may not appear after first setup, for that copy the 
php from browser into "wp-cofig.php" of wordpress folder and save it !!
The instruction is also provided within the main script.
