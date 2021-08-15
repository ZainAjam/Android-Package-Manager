#!/bin/bash

##
# BASH menu script that allows:
#   - Checking prerequirements for this tool
#   - Update linux packages
#   - Install adb
#   - Check if mobile device is authorized for access by the computer
#   - Check which packages this tool enables or disables
#   - Disable packages
#   - Enable packages
##

##
# Color  Variables
##

red='\e[1;31m'
green='\e[32m'
yellow='\e[33m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}
ColorRed(){
	echo -ne $red$1$clear
}
ColorYellow(){
	echo -ne $yellow$1$clear
}

##
# Menu Selection Functions
##

function readme() {
	echo $(ColorRed 'Read me')
	echo
  file="readme.txt"
	while IFS= read -r line
	do
		echo "$line"
	done < "$file"
	echo
	echo $(ColorBlue 'Press ENTER to return to menu')
	read -p ""
	clear
}

function update_linux_packages() {
	echo $(ColorRed 'Update Linux Packages')
	echo
  sudo apt-get update
	echo
	echo $(ColorBlue 'Press ENTER to return to menu')
	read -p ""
	clear
}

function install_adb() {
	echo $(ColorRed 'Install ADB')
	echo
  sudo apt-get install adb
	echo
	echo $(ColorBlue 'Press ENTER to return to menu')
	read -p ""
	clear
}

function adb_connect_over_wifi() {
	echo $(ColorRed 'Connect to device over WiFi')
	echo
  echo What is the IP address of the android device?
	echo
  read ip
	echo
  sudo adb connect $ip
	echo
	echo You may be prompted to approve debugging on your device. Approve on the device before proceeding here.
	echo
	echo $(ColorBlue 'Press ENTER to return to menu')
	read -p ""
	clear
}

function adb_disconnect_over_wifi() {
	echo $(ColorRed 'Disconnect from device over WiFi')
	echo
	sudo adb devices
	echo
  echo "What is the IP address of the android device to want to disconnect? (* to disconnect all; c to cancel)"
	echo
  read ip
	echo
	if [[ ${ip} == "c" ]] || [[ ${ip} == "" ]]
	then
		return 0
	elif [[ ${ip} == "*" ]]
	then
	  sudo adb disconnect
  else
		sudo adb disconnect $ip
	fi
	echo
	echo $(ColorBlue 'Press ENTER to return to menu')
	read -p ""
	clear
}

function check_mobile_device_auth() {
	echo $(ColorRed 'Check connected devices')
	echo
  sudo adb devices
	echo
	echo $(ColorBlue 'Press ENTER to return to menu')
	read -p ""
	clear
}

function check_disabled_packages() {
	echo $(ColorRed 'Show disabled packages')
	echo
  sudo adb shell pm list packages -d
	echo
	echo $(ColorBlue 'Press ENTER to return to menu')
	read -p ""
	clear
}

function check_enabled_packages() {
	echo $(ColorRed 'Show enabled packages')
	echo
  sudo adb shell pm list packages -e
	echo
	echo $(ColorBlue 'Press ENTER to return to menu')
	read -p ""
	clear
}

function which_packages() {
	echo $(ColorRed 'Packages configured for bulk disabling')
	echo
	echo This tool is currently configured to disable the following packages.
  echo
  file="disable_packages.txt"
	while IFS= read -r line
	do
		if [[ ${line:0:1} != "#" ]] && [[ ${line:0:1} != "" ]]
	  then
	    echo - "$line"
		fi
	done < "$file"
	echo
	echo $(ColorBlue 'Press ENTER to see the list of packages that this tool is currently configured to enable')
	read -p ""
	clear
	echo $(ColorRed 'Packaged configured for bulk enabling')
	echo
	echo This tool is currently configured to enable the following packages.
  echo
  file="enable_packages.txt"
	while IFS= read -r line
	do
		if [[ ${line:0:1} != "#" ]] && [[ ${line:0:1} != "" ]]
	  then
	    echo - "$line"
		fi
	done < "$file"
	echo
	echo $(ColorBlue 'Press ENTER to return to menu')
	read -p ""
	clear
}

function disable_package() {
	echo $(ColorRed 'Disable a package')
	echo
	echo Type in the name of the package that you would like to disable:
  echo
	read package
	sudo adb shell pm disable-user --user 0 $package
	echo
	echo $(ColorBlue 'Press ENTER to return to menu')
	read -p ""
	clear
}

function enable_package() {
	echo $(ColorRed 'Enable a package')
	echo
	echo Type in the name of the package that you would like to enable:
  echo
	read package
	sudo adb shell pm enable $package
	echo
	echo $(ColorBlue 'Press ENTER to return to menu')
	read -p ""
	clear
}

function disable_packages() {
	echo $(ColorRed 'Bulk package disable')
	echo
	echo Disabling packages:
	echo
	file="disable_packages.txt"
	while IFS="" read -r line <&3
	do
		if [[ ${line:0:1} != "#" ]] && [[ ${line:0:1} != "" ]]
		then
			var=$(adb shell pm path "$line")
			if [[ $var != "" ]]
			then
				sudo adb shell pm disable-user --user 0 "$line"
			else
				echo $(ColorYellow 'Skipped. Package not installed on device.') "$line"
			fi
		fi
	done 3< "$file"
	echo
	echo $(ColorBlue 'Press ENTER to return to menu')
	read -p ""
	clear
}

function enable_packages() {
	echo $(ColorRed 'Bulk package enable')
	echo
	echo Enabling packages:
	echo
	file="enable_packages.txt"
	while IFS="" read -r line <&3
	do
		if [[ ${line:0:1} != "#" ]] && [[ ${line:0:1} != "" ]]
		then
			var=$(adb shell pm path "$line")
			if [[ $var != "" ]]
			then
				sudo adb shell pm enable "$line"
			else
				echo $(ColorYellow 'Skipped') "$line"
			fi
		fi
	done 3< "$file"
	echo
	echo $(ColorBlue 'Press ENTER to return to menu')
	read -p ""
	clear
}

##
# Menu Creation
##

menu(){
clear
echo -ne "$(ColorRed 'ANDROID PACKAGE MANAGER')

$(ColorGreen ' 0)') Return to main menu

-----------------------------------------------------------------------------------------------
System Preparation
-----------------------------------------------------------------------------------------------
$(ColorGreen ' 1)') Read me
$(ColorGreen ' 2)') Update linux packages                            -- Skip if system already up to date
$(ColorGreen ' 3)') Install adb packages                             -- Skip if adb already installed on system

-----------------------------------------------------------------------------------------------
Connect / Disconnect Devices
-----------------------------------------------------------------------------------------------
$(ColorGreen ' 4)') Connect device over wifi                         -- Not required for USB connected devices
$(ColorGreen ' 5)') Disconnect device over wifi                      -- Not required for USB connected devices
$(ColorGreen ' 6)') Check mobile devices connected and authorized

-----------------------------------------------------------------------------------------------
Assess packages
-----------------------------------------------------------------------------------------------
$(ColorGreen ' 7)') Check bulk package listing
$(ColorGreen ' 8)') Check packages currently disabled on device      $(ColorYellow '-- Only works when one device is connected')
$(ColorGreen ' 9)') Check packages currently enabled on device       $(ColorYellow '-- Only works when one device is connected')

-----------------------------------------------------------------------------------------------
Disable / Enable packages
-----------------------------------------------------------------------------------------------
$(ColorGreen '10)') Disable packages (Bulk disable)                  $(ColorYellow '-- Only works when one device is connected')
$(ColorGreen '11)') Enable packages (Bulk enable)                    $(ColorYellow '-- Only works when one device is connected')
$(ColorGreen '12)') Disable a package                                $(ColorYellow '-- Only works when one device is connected')
$(ColorGreen '13)') Enable a package                                 $(ColorYellow '-- Only works when one device is connected')

$(ColorBlue 'Choose an option:') "
        read a
        case $a in
	        1) clear; readme ; menu ;;
	        2) clear; update_linux_packages ; menu ;;
	        3) clear; install_adb ; menu ;;
          4) clear; adb_connect_over_wifi ; menu ;;
					5) clear; adb_disconnect_over_wifi; menu ;;
	        6) clear; check_mobile_device_auth ; menu ;;
					7) clear; which_packages ; menu ;;
					8) clear; check_disabled_packages ; menu ;;
					9) clear; check_enabled_packages ; menu ;;
					10) clear; disable_packages ; menu ;;
					11) clear; enable_packages ; menu ;;
					12) clear; disable_package ; menu ;;
					13) clear; enable_package ; menu ;;
					0) clear; exit 0 ;;
					*) clear ; menu ;;
        esac
}

#Call the menu function
menu
