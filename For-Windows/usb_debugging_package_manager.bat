:menu
cls
echo Package Manager over USB:
echo.
echo 1) Tool prerequisites
echo 2) Check mobile device authorization
echo 3) Packages managed
echo 4) Disable packages
echo 5) Enable packages
echo 0) Return to main menu
echo.
SET /P a=Type a selecion between 1 and 5 then press ENTER:
IF %a%==1 GOTO tool_prerequisities
IF %a%==2 GOTO check_mobile_device_auth
IF %a%==3 GOTO which_packages
IF %a%==4 GOTO disable_packages
IF %a%==5 GOTO enable_packages
IF %a%==0 GOTO return_to_main_menu

:tool_prerequisities
cls
echo Ensure that the following are in place before using this tool:
echo.
echo 1. The mobile device is in developer mode and USB debugging is enabled
echo 2. The mobile device is authorized for access by this computer
echo 3. Android USB drivers are installed on this windows PC
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
echo OneUI 3.1:
echo -  com.samsung.android.calendar
echo -  com.samsung.android.kidsinstaller
echo -  com.samsung.android.app.settings.bixby
echo -  com.sec.android.daemonapp
echo -  com.samsung.systemui.bixby2
echo -  com.samsung.android.bixby.service
echo -  com.samsung.android.messaging
echo -  com.samsung.android.bixby.agent
echo -  com.samsung.android.app.reminder
echo -  com.sec.android.app.clockpackage
echo -  com.samsung.android.app.routines
echo -  com.samsung.android.authfw
echo -  com.samsung.android.bixbyvision.framework
echo -  com.samsung.android.bixby.wakeup
echo -  com.samsung.android.samsungpass
echo -  com.samsung.android.app.spage
echo -  com.samsung.android.visionintelligence
echo -  com.samsung.android.svoiceime
echo -  com.samsung.android.samsungpassautofill
echo -  com.samsung.android.tapack.authfw
echo -  com.samsung.android.bixby.agent.dummy
echo.
SET /P M=Press any key to return to menu:
GOTO menu


:disable_packages
cls
echo Disabling OneUI 3.1 Packages:
echo.
adb shell pm disable-user --user 0 com.samsung.android.calendar
adb shell pm disable-user --user 0 com.samsung.android.kidsinstaller
adb shell pm disable-user --user 0 com.samsung.android.app.settings.bixby
adb shell pm disable-user --user 0 com.sec.android.daemonapp
adb shell pm disable-user --user 0 com.samsung.systemui.bixby2
adb shell pm disable-user --user 0 com.samsung.android.bixby.service
adb shell pm disable-user --user 0 com.samsung.android.messaging
adb shell pm disable-user --user 0 com.samsung.android.bixby.agent
adb shell pm disable-user --user 0 com.samsung.android.app.reminder
adb shell pm disable-user --user 0 com.sec.android.app.clockpackage
adb shell pm disable-user --user 0 com.samsung.android.app.routines
adb shell pm disable-user --user 0 com.samsung.android.authfw
adb shell pm disable-user --user 0 com.samsung.android.bixbyvision.framework
adb shell pm disable-user --user 0 com.samsung.android.bixby.wakeup
adb shell pm disable-user --user 0 com.samsung.android.samsungpass
adb shell pm disable-user --user 0 com.samsung.android.app.spage
adb shell pm disable-user --user 0 com.samsung.android.visionintelligence
adb shell pm disable-user --user 0 com.samsung.android.svoiceime
adb shell pm disable-user --user 0 com.samsung.android.samsungpassautofill
adb shell pm disable-user --user 0 com.samsung.android.tapack.authfw
adb shell pm disable-user --user 0 com.samsung.android.bixby.agent.dummy
echo.
SET /P M=Press any key to return to menu:
GOTO menu

:enable_packages
cls
echo Enabling OneUI 3.1 Packages:
echo.
adb shell pm enable com.samsung.android.calendar
adb shell pm enable com.samsung.android.kidsinstaller
adb shell pm enable com.samsung.android.app.settings.bixby
adb shell pm enable com.sec.android.daemonapp
adb shell pm enable com.samsung.systemui.bixby2
adb shell pm enable com.samsung.android.bixby.service
adb shell pm enable com.samsung.android.messaging
adb shell pm enable com.samsung.android.bixby.agent
adb shell pm enable com.samsung.android.app.reminder
adb shell pm enable com.sec.android.app.clockpackage
adb shell pm enable com.samsung.android.app.routines
adb shell pm enable com.samsung.android.authfw
adb shell pm enable com.samsung.android.bixbyvision.framework
adb shell pm enable com.samsung.android.bixby.wakeup
adb shell pm enable com.samsung.android.samsungpass
adb shell pm enable com.samsung.android.app.spage
adb shell pm enable com.samsung.android.visionintelligence
adb shell pm enable com.samsung.android.svoiceime
adb shell pm enable com.samsung.android.samsungpassautofill
adb shell pm enable com.samsung.android.tapack.authfw
adb shell pm enable com.samsung.android.bixby.agent.dummy
echo.
SET /P M=Press any key to return to menu:
GOTO menu

:return_to_main_menu
android_package_manager.bat