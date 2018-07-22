
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
dpkg --get-selections | grep apache2
if  [ $? -eq 0 ]; then
        echo "apache is already installed"
elif  [ $? -eq 1 ]; then
	echo "apache not found on your system"
	sleep 0.5
	echo "if you want i cant install apache for you. Type Y if you want to or N if you dont want"
fi


