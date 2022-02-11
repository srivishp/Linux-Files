#!/bin/bash

# get OS update
while true; do

read -p "Do you want to update OS? Press y/n to continue." yn
case $yn in
	[Yy]* ) sudo apt-get update; break;;
	
	[Nn]* )
esac

# install wifi
read -p "Do you want to install WiFi drivers? Press y/n to continue." yn
case $yn in
	[Yy]* )
git clone https://github.com/lwfinger/rtlwifi_new.git

cd rtlwifi_new/ && git checkout origin/extended -b extended

sudo apt-get install linux-headers-generic build-essential git

sudo make install

sudo modprobe -r rtl8723de

sudo modprobe rtl8723de

sudo apt purge bcmwl-kernel-source

sudo sed -i '/blacklist bcma/ d' /etc/modprobe.d/blacklist.conf

sudo sed -i '/blacklist brcmsmac/ d' /etc/modprobe.d/blacklist.conf; break;;

	[Nn]* ) 
	
esac

# install HP printer 

read -p "Do you want to install Printer Drivers? Press y/n to continue." yn
case $yn in
	[Yy]* ) cd /tmp && wget http://prdownloads.sourceforge.net/hplip/hplip-3.17.11.run
		sh hplip-3.17.11.run; break;;
	
	[Nn]* ) 
	
esac

#install Python
read -p "Do you want to install Python? Press y/n to continue." yn
    case $yn in
        [Yy]* ) sudo apt-get install python3.7
		sudo apt-get upgrade python3
		sudo apt install python-pip
		pip install numpy
		python3 -m pip install jupyter
		pip install matplotlib; break;;
	[Nn]* ) 
esac

#install Java
	
read -p "Do you wish to install Java? Press y/n to continue." yn
case $yn in
	[Yy]* ) sudo apt install jdk
   		sudo apt install openjdk-8
   		sudo add-apt-repository ppa:openjdk-r/ppa 
   		sudo apt update 
   		sudo apt install openjdk-8-jdk
   		java -version; break;;
    	[Nn]* ) 

esac

# install Andromeda

read -p "Do you want to install Andromeda? Press y/n to continue." yn
case $yn in
        [Yy]* )  xdg-open https://androidfilehost.com/?fid=961840155545594692; break;;
        [Nn]* ) 
        
esac

# install Wireshark
read -p "Do you wish to install Wireshark? Press y/n to continue." yn
case $yn in
	[Yy]* ) sudo apt install wireshark-qt; break;;
    	[Nn]* ) exit;;

esac

done


