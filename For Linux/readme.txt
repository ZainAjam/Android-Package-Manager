Android Package Manager built for linux to:
* View packages on adb connected devices
* Allows adb connections through USB or WiFi
* Enable and disable packages on android devices at bulk or individually

To effectively use this package manager, ensure the following has been done:

1. Enable developer options on your device by tapping build number on your phone 7 times
2. Open the developer options and ensure that USB debugging or WiFi debugging is enabled
3. When using connection over USB: Connect the device to a Linux computer by USB and authorize the computer for adb debugging on the phone when it pops up
4. Copy all the files from this tool in to a folder in a Linux environment
5. Navigate to that folder in Linux terminal
6. Execute the command:
        bash android_package_manager.sh

Note: The packages that you want to disable or enable can be changed by editing the enable_packages.txt and disable_packages.txt files. Make sure that the correct packages are listed in the text files before running the bulk actions in the package manager
