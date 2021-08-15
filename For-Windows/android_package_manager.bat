ECHO OFF

:menu
cls
echo NOTE: This application is currently built to operate with one ADB connected device at a time
echo.
echo Android Package Manager:
echo.
echo 1) ADB over USB
echo 2) ADB over WiFi
echo 0) Exit
echo.
SET /P a=Type 1 or 2 then press ENTER:
IF %a%==1 GOTO usb_debugging
IF %a%==2 GOTO wifi_debugging
IF %a%==0 GOTO EOF

:usb_debugging
cls
usb_debugging_package_manager.bat
echo.
SET /P M=Press any key to return to menu:
goto menu

:wifi_debugging
cls
wifi_debugging_package_manager.bat
echo.
SET /P M=Press any key to return to menu:
goto menu


