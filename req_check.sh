which mysql > /dev/null 2>&1
if [ $? -eq 0 ]; then 
	echo "mysql is already installed"
elif [ $? -eq 1 ]; then
	echo "mysql is not installed on your system"
	sleep 1
	echo "if you want to install mysql for your type y or n if you dont want"
	read input

	if [ "$input" = "y" ]; then
		sudo apt-get install mysql
	elif [ "$input" = "n" ]; then
		echo "no"
	fi			
fi
sleep 1

#### apache2  check
dpkg --get-selections | grep apache2 > /dev/null 2>1
if  [ $? -eq 0 ]; then
        echo "apache is already installed"
elif  [ $? -eq 1 ]; then
	echo "apache not found on your system"
	sleep 0.5
	echo "if you want i cant install apache for you. Type Y if you want to or N if you dont want"
fi
sleep 1



### curl check
curl -V > /dev/null 2>&1
if [ $? -eq 0 ]; then 
	echo "curl is installed"
elif [ $? -eq 1 ]; then 
	echo "curl is not installed on your system"
        sleep 0.2
        echo "if you want to install curl for you type Y or N if you dont"
        read inputs
        if [ $input -o "y" ]; then
                sudo apt-get install curl
        fi
fi
sleep 1

#### wp-cli check
wp --info
if [ $? -eq 0 ]; then	
	echo "wp-cli already found"
elif [ $? -eq 1 ]; then
	echo "wp-cli not found on your system"
	sleep 0.5
	echo "If you want to install it for you press Y, if not press type N"
	read input
	if [ "$input" = "y"]; then
		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
		chmod +x wp-cli.phar
		sudo mv wp-cli.phar /usr/local/bin/wp
	fi
fi
