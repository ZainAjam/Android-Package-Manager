echo off

:menu
cls
echo Package Manager over USB:
echo.
echo 1) Tool prerequisites
echo 2) Connect device over wifi (skip if device connected over USB)
echo 3) Disconnect device over wifi (skip if device connected over USB)
echo 4) Check mobile device authorization
echo 5) Packages managed
echo 6) Disable packages
echo 7) Enable packages
echo.
SET /P a=Type a selecion between 1 and 7 then press ENTER:
IF %a%==1 GOTO tool_prerequisities
IF %a%==2 GOTO connect_over_wifi
IF %a%==3 GOTO disconnect_over_wifi
IF %a%==4 GOTO check_mobile_device_auth
IF %a%==5 GOTO which_packages
IF %a%==6 GOTO disable_packages
IF %a%==7 GOTO enable_packages

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

:connect_over_wifi
cls
echo "Connect to device over WiFi"
echo.
SET /P ip= "What is the IP address of the android device? "
adb connect %ip%
echo.
echo You may be prompted to approve debugging on your device. Approve on the device before proceeding here.
echo.
SET /P M=Press any key to return to menu:
GOTO menu

:disconnect_over_wifi
cls
echo "Disconnect from device over WiFi"
echo.
adb devices
echo.
SET /P ip= "What is the IP address of the android device to want to disconnect? (* to disconnect all; c to cancel) "
echo.
If "%ip%"=="" (
  GOTO menu
) Else (
    If "%ip%"=="c" (
      GOTO menu
    ) Else (
        If "%ip%"=="*" (
          adb disconnect
          adb kill-server
          adb start-server
	) Else (
	  adb disconnect %ip%
	)
    )
)
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
echo oneui 3.1 packages on phone or tablet
echo -------------------------------------
echo com.samsung.android.calendar
echo com.samsung.android.kidsinstaller
echo com.samsung.android.app.settings.bixby
echo com.sec.android.daemonapp
echo com.samsung.systemui.bixby2
echo com.samsung.android.bixby.service
echo com.samsung.android.messaging
echo com.samsung.android.bixby.agent
echo com.samsung.android.app.reminder
echo com.sec.android.app.clockpackage
echo com.samsung.android.app.routines
echo com.samsung.android.authfw
echo com.samsung.android.bixbyvision.framework
echo com.samsung.android.bixby.wakeup
echo com.samsung.android.samsungpass
echo com.samsung.android.app.spage
echo com.samsung.android.visionintelligence
echo com.samsung.android.svoiceime
echo com.samsung.android.samsungpassautofill
echo com.samsung.android.tapack.authfw
echo com.samsung.android.bixby.agent.dummy
echo.
echo oneui 3.0 packages on wear os watch like Galaxy Watch 4:
echo --------------------------------------------------------
echo com.samsung.android.app.reminder
echo com.samsung.android.bixby.agent
echo com.samsung.android.bixby.wakeup
echo com.samsung.android.calendar
echo com.samsung.android.messaging
echo com.samsung.android.watch.alarm
echo com.samsung.android.watch.stopwatch
echo com.samsung.android.watch.timer
echo com.samsung.android.watch.watchface.analogmodular
echo com.samsung.android.watch.watchface.analoguefont
echo com.samsung.android.watch.watchface.animal
echo com.samsung.android.watch.watchface.aremoji
echo com.samsung.android.watch.watchface.basicclock
echo com.samsung.android.watch.watchface.bitmoji
echo com.samsung.android.watch.watchface.companionhelper
echo com.samsung.android.watch.watchface.digitalfont
echo com.samsung.android.watch.watchface.digitalmodular
echo com.samsung.android.watch.watchface.dualwatch
echo com.samsung.android.watch.watchface.emergency
echo com.samsung.android.watch.watchface.endangeredanimal
echo com.samsung.android.watch.watchface.intrepid
echo com.samsung.android.watch.watchface.large
echo com.samsung.android.watch.watchface.myphoto
echo com.samsung.android.watch.watchface.mystyle
echo com.samsung.android.watch.watchface.premiumanalog
echo com.samsung.android.watch.watchface.simpleanalogue
echo com.samsung.android.watch.watchface.simplebasic
echo com.samsung.android.watch.watchface.simpleclassic
echo com.samsung.android.watch.watchface.simplecomplication
echo com.samsung.android.watch.watchface.superfiction
echo com.samsung.android.watch.watchface.tickingsound
echo com.samsung.android.watch.watchface.together
echo com.samsung.android.watch.watchface.typography
echo com.samsung.android.watch.weather
echo com.samsung.android.watch.worldclock
echo com.samsung.android.wear.calculator
echo.
echo fossil wear os 2 Packages
echo -------------------------
echo com.fossil.elabel
echo com.fossil.twm
echo com.fossil.wearable.pusher
echo com.fossil.wearable.fspropertyutils
echo com.fossil.activationanalytic
echo com.fossil.oemsetup.triggerfish
echo com.fossil.hfpconnector
echo com.fossil.wearables.sk
echo com.fossil.wearables.healthtracker
echo com.fossil.wearos.sensoraccessservice
echo com.fossil.phone
echo com.fossil.charge.darter
echo com.fossil.wearables.savedfaceservice
echo com.fossil.wearables.batterysaver
echo com.fossil.oemsetup.darter
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
echo Disabling OneUI 3.0 Packages on Wear OS:
adb shell pm disable-user --user 0 com.samsung.android.app.reminder
adb shell pm disable-user --user 0 com.samsung.android.bixby.agent
adb shell pm disable-user --user 0 com.samsung.android.bixby.wakeup
adb shell pm disable-user --user 0 com.samsung.android.calendar
adb shell pm disable-user --user 0 com.samsung.android.messaging
adb shell pm disable-user --user 0 com.samsung.android.watch.alarm
adb shell pm disable-user --user 0 com.samsung.android.watch.stopwatch
adb shell pm disable-user --user 0 com.samsung.android.watch.timer
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.analogmodular
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.analoguefont
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.animal
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.aremoji
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.basicclock
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.bitmoji
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.companionhelper
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.digitalfont
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.digitalmodular
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.dualwatch
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.emergency
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.endangeredanimal
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.intrepid
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.large
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.myphoto
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.mystyle
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.premiumanalog
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.simpleanalogue
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.simplebasic
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.simpleclassic
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.simplecomplication
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.superfiction
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.tickingsound
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.together
adb shell pm disable-user --user 0 com.samsung.android.watch.watchface.typography
adb shell pm disable-user --user 0 com.samsung.android.watch.weather
adb shell pm disable-user --user 0 com.samsung.android.watch.worldclock
adb shell pm disable-user --user 0 com.samsung.android.wear.calculator
echo.
echo Disabling Fossil Wear OS 2 Packages
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
echo Enabling OneUI 3.0 Packages on Wear OS:
adb shell pm enable com.samsung.android.app.reminder
adb shell pm enable com.samsung.android.bixby.agent
adb shell pm enable com.samsung.android.bixby.wakeup
adb shell pm enable com.samsung.android.calendar
adb shell pm enable com.samsung.android.messaging
adb shell pm enable com.samsung.android.watch.alarm
adb shell pm enable com.samsung.android.watch.stopwatch
adb shell pm enable com.samsung.android.watch.timer
adb shell pm enable com.samsung.android.watch.watchface.analogmodular
adb shell pm enable com.samsung.android.watch.watchface.analoguefont
adb shell pm enable com.samsung.android.watch.watchface.animal
adb shell pm enable com.samsung.android.watch.watchface.aremoji
adb shell pm enable com.samsung.android.watch.watchface.basicclock
adb shell pm enable com.samsung.android.watch.watchface.bitmoji
adb shell pm enable com.samsung.android.watch.watchface.companionhelper
adb shell pm enable com.samsung.android.watch.watchface.digitalfont
adb shell pm enable com.samsung.android.watch.watchface.digitalmodular
adb shell pm enable com.samsung.android.watch.watchface.dualwatch
adb shell pm enable com.samsung.android.watch.watchface.emergency
adb shell pm enable com.samsung.android.watch.watchface.endangeredanimal
adb shell pm enable com.samsung.android.watch.watchface.intrepid
adb shell pm enable com.samsung.android.watch.watchface.large
adb shell pm enable com.samsung.android.watch.watchface.myphoto
adb shell pm enable com.samsung.android.watch.watchface.mystyle
adb shell pm enable com.samsung.android.watch.watchface.premiumanalog
adb shell pm enable com.samsung.android.watch.watchface.simpleanalogue
adb shell pm enable com.samsung.android.watch.watchface.simplebasic
adb shell pm enable com.samsung.android.watch.watchface.simpleclassic
adb shell pm enable com.samsung.android.watch.watchface.simplecomplication
adb shell pm enable com.samsung.android.watch.watchface.superfiction
adb shell pm enable com.samsung.android.watch.watchface.tickingsound
adb shell pm enable com.samsung.android.watch.watchface.together
adb shell pm enable com.samsung.android.watch.watchface.typography
adb shell pm enable com.samsung.android.watch.weather
adb shell pm enable com.samsung.android.watch.worldclock
adb shell pm enable com.samsung.android.wear.calculator
echo.
echo Enabling Fossil Wear OS 2 Packages
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