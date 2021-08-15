Android Package Manager built for Windows to:
* View packages on adb connected devices
* Allows adb connections through USB or WiFi
* Enable and disable packages on android devices at bulk or individually

To effectively use this package manager, ensure the following has been done:

1. Enable developer options on your device by tapping build number on your phone 7 times
2. Open the developer options and ensure that USB debugging or WiFi debugging is enabled
3. Ensure that Android USB drivers are installed on the computer
4. When using connection over USB: Connect the device to a Linux computer by USB and authorize the computer for adb debugging on the phone when it pops up
5. Copy all the bat files in to a folder in Windows environment
6. Navigate to that folder in Windows command prompt
7. Execute the command:
        android_package_manager.bat
