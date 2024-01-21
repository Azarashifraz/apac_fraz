#!bin/sh

#Menu body
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

#reads menu number store in menu
read -p "Choose the type: " menu 

#Menu workspace using if and elif
if [[ $menu == 1 || $menu == 01 ]];  then

	#Apache starter
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

	#Apache Restart
	clear
        echo "Re-starting Apache server."
	service apache2 restart
	sleep 1
	echo "Re-start Apache completed, If any error contact thegodfraz@gmail.com"
	bash apache2.sh

elif [[ $menu == 4 || $menu == 04 ]]; then

	#Moving files, menu
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

 #reads the value and store it in ch
	read -p "Choice :" ch

	if [[ $ch == 1 || $ch == 01 ]]; then
		clear
		echo
  #reads the value and store it in flwn(File location with name)
		read -p "File Location with name :" flwn
		cd
		sudo mv $flwn /var/www/html
		echo "Moving file"
		sleep 1
		echo "File have been moved. Returning"
		sleep 1
		cd apac_fraz
		bash apache2.sh
	elif [[ $ch == 2 || $ch == 02 ]]; then
		clear
		echo
  #reads the value and store it in fn(File name)
		read -p "File Name :" fn

		sudo mv $fn /var/www/html
		echo "Moving File"
		sleep 1
		echo "File have been moved. Returning"
		sleep 1
		bash apache2.sh
	elif [[ $ch == 3 || $ch == 03 ]]; then
 #Return of moving files menu
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
	echo "Unknown Selection"
	bash apache2.sh
fi
#Version 1
#Created by azarashifraz, Fraz nickname
