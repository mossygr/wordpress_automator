

echo "First i will check for all requiremats"
#sh req_check.sh


wp_needs() {
    echo "Type your url for wordpress installation"
    read url
    sleep 1

    echo "Type your title for wordpress installation"
    read title
    sleep 1

    echo "Type your username for your wordpress inallation"
    read username
    sleep 1

    echo "Type your password for your wordpress intallation"
    read -s password
    sleep 1

    echo "Type your email for your wordpress intallation"
    read email
    sleep 1

    echo  -e "username : "$username"\npassword : "$password"" > inputs.txt

    echo "If you ever forget your username and password open inputs.txt"
}
wp_needs

sudo chown -R $USER:$USER /var/www/html
wp core download --path=/var/www/html  --locale=en_US
wp core install  --path=/var/www/html/ --url=$url --title=$title --admin_user=$username --admin_password=$password --admin_email=$email