:menu
cls
echo Package Manager over WiFi:
echo.
echo 1) Tool prerequisites
echo 2) Connect to device over wifi
echo 3) Check mobile device authorization
echo 4) Packages managed
echo 5) Disable packages
echo 6) Enable packages
echo 0) Return to main menu
echo.
SET /P a=Type a selecion between 1 and 5 then press ENTER:
IF %a%==1 GOTO tool_prerequisities
IF %a%==2 GOTO adb_connect_over_wifi
IF %a%==3 GOTO check_mobile_device_auth
IF %a%==4 GOTO which_packages
IF %a%==5 GOTO disable_packages
IF %a%==6 GOTO enable_packages
IF %a%==0 GOTO return_to_main_menu

:tool_prerequisities
cls
echo Ensure that the following are in place before using this tool:
echo 1. The mobile device is in developer mode and wireless debugging is enabled
echo 2. The mobile device is authorized for access by this computer
echo 3. Android USB drivers are installed on this windows PC
echo.
SET /P M=Press any key to return to menu:
GOTO menu

:adb_connect_over_wifi
cls
SET /P ip=What is your IP address:
echo.
adb connect %ip%
echo.
echo You may be prompted to approve debugging on your device. Approve on the device before proceeding here.
echo.
SET /P M=Press any key to return to menu:
GOTO menu


:check_mobile_device_auth
cls
adb devices
echo.
SET /P M=Press any key to return to menu:
GOTO menu

:which_packages
cls
echo This tool is built to disable and enable the below packages.
echo.
echo Fossil Watch:
echo -  com.fossil.elabel
echo -  com.fossil.twm
echo -  com.fossil.wearable.pusher
echo -  com.fossil.wearable.fspropertyutils
echo -  com.fossil.activationanalytic
echo -  com.fossil.oemsetup.triggerfish
echo -  com.fossil.hfpconnector
echo -  com.fossil.wearables.sk
echo -  com.fossil.wearables.healthtracker
echo -  com.fossil.wearos.sensoraccessservice
echo -  com.fossil.phone
echo -  com.fossil.charge.darter
echo -  com.fossil.wearables.savedfaceservice
echo -  com.fossil.wearables.batterysaver
echo -  com.fossil.oemsetup.darter
echo.
SET /P M=Press any key to return to menu:
GOTO menu


:disable_packages
cls
echo Disabling Fossil Watch Packages:
echo.
adb shell pm disable-user --user 0 com.fossil.elabel
adb shell pm disable-user --user 0 com.fossil.twm
adb shell pm disable-user --user 0 com.fossil.wearable.pusher
adb shell pm disable-user --user 0 com.fossil.wearable.fspropertyutils
adb shell pm disable-user --user 0 com.fossil.activationanalytic
adb shell pm disable-user --user 0 com.fossil.oemsetup.triggerfish
adb shell pm disable-user --user 0 com.fossil.hfpconnector
adb shell pm disable-user --user 0 com.fossil.wearables.sk
adb shell pm disable-user --user 0 com.fossil.wearables.healthtracker
adb shell pm disable-user --user 0 com.fossil.wearos.sensoraccessservice
adb shell pm disable-user --user 0 com.fossil.phone
adb shell pm disable-user --user 0 com.fossil.charge.darter
adb shell pm disable-user --user 0 com.fossil.wearables.savedfaceservice
adb shell pm disable-user --user 0 com.fossil.wearables.batterysaver
adb shell pm disable-user --user 0 com.fossil.oemsetup.darter
echo.
SET /P M=Press any key to return to menu:
GOTO menu

:enable_packages
cls
echo Enabling Fossil Watch Packages:
echo.
adb shell pm enable com.fossil.elabel
adb shell pm enable com.fossil.twm
adb shell pm enable com.fossil.wearable.pusher
adb shell pm enable com.fossil.wearable.fspropertyutils
adb shell pm enable com.fossil.activationanalytic
adb shell pm enable com.fossil.oemsetup.triggerfish
adb shell pm enable com.fossil.hfpconnector
adb shell pm enable com.fossil.wearables.sk
adb shell pm enable com.fossil.wearables.healthtracker
adb shell pm enable com.fossil.wearos.sensoraccessservice
adb shell pm enable com.fossil.phone
adb shell pm enable com.fossil.charge.darter
adb shell pm enable com.fossil.wearables.savedfaceservice
adb shell pm enable com.fossil.wearables.batterysaver
adb shell pm enable com.fossil.oemsetup.darter
echo.
SET /P M=Press any key to return to menu:
GOTO menu


:return_to_main_menu
android_package_manager.bat

