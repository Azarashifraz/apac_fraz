#!bin/sh
echo
echo
echo
echo
echo
chmod +x *
echo "---------------------"
echo "---Apache-Menu--v1---"
echo "---------------------"
echo "		Contact :thegodfraz@gmail.com"
echo
echo
echo "[1] --> Start Apache"
echo "[2] --> Status Apache"
echo "[3] --> Restart Apache"
echo "[4] --> Move File to Apache"
echo "[5] --> Stop Apache"
echo "[6] --> Exit Menu"
echo

read -p "Choose the type: " menu 


if [[ $menu == 1 || $menu == 01 ]];  then
	clear
	echo "Starting Apache Server to localhost."
       service apache2 start
       sleep 1
       echo "Apache server successfully started, If error please contact thegodfraz@gmail.com"
       echo "To check the address use ifconfig and find local address"
       bash apache2.sh

elif [[ $menu == 2 || $menu == 02 ]]; then
 	service apache2 status

elif [[ $menu == 3 || $menu == 03 ]]; then
	clear
        echo "Re-starting Apache server."
	service apache2 restart
	sleep 1
	echo "Re-start Apache completed, If any error contact thegodfraz@gmail.com"
	bash apache2.sh

elif [[ $menu == 4 || $menu == 04 ]]; then
	clear
	echo
	echo
	echo
	echo "--------------------"
	echo "---Move File Menu---"
	echo "--------------------"
	echo
	echo
	echo "[1] --> Choose File From Dictionary"
	echo "[2] --> File in apache2 dictionary"
	echo "[3] --> Back"
	echo
	read -p "Choice :" ch

	if [[ $ch == 1 || $ch == 01 ]]; then
		clear
		echo
		read -p "File Location with name :" flwn
		cd
		sudo mv $flwn /var/www/html
		echo "Moving file"
		sleep 1
		echo "File have been moved. Returning"
		sleep 1
		cd Apache
		bash apache2.sh
	elif [[ $ch == 2 || $ch == 02 ]]; then
		clear
		echo
		read -p "File Name :" fn

		sudo mv $fn /var/www/html
		echo "Moving File"
		sleep 1
		echo "File have been moved. Returning"
		sleep 1
		bash apache2.sh
	elif [[ $ch == 3 || $ch == 03 ]]; then
		bash apache2.sh
	else 
		echo "Unknown Selection"
		bash apache2.sh
	fi
elif [[ $menu == 5 || $menu == 05 ]]; then
	clear
	echo "Stop Apache service"
	service apache2 stop
	sleep 1
	echo "service apache2 has been successfully revoked"
	bash apache2.sh
elif [[ $menu == 6 || $menu == 06 ]]; then
	clear
else
	bash apache2.sh
fi
