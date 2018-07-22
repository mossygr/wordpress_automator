
which mysql > /dev/null 2>&1
if [ $? -eq 0 ]; then 
	echo "mysql is already installed"
elif [ $? -eq 1 ]; then
	echo "mysql is not installed on your system"
	sleep 1
	echo "if you want to install mysql for your type y or n if you dont want"
	read input
	if [ $input -o "y" ]; then
		sudo apt-get install mysql
	fi			
fi

sleep 1
dpkg --get-selections | grep apache2 > /dev/null 2>1
if  [ $? -eq 0 ]; then
        echo "apache is already installed"
elif  [ $? -eq 1 ]; then
	echo "apache not found on your system"
	sleep 0.5
	echo "if you want i cant install apache for you. Type Y if you want to or N if you dont want"
fi

sleep 1
curl -V > /dev/null 2>&1
if [ $? -eq 0 ]; then 
	echo "curl is installed"
elif [ $? -eq 1 ]; then 
	echo "curl is not installed on your system"
        sleep 0.2
        echo "if you want to install curl for you type Y or N if you dont"
        read input
        if [ $input -o "y" ]; then
                sudo apt-get install curl
        fi
fi
