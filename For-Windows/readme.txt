---------------------------------------------
PURPOSE OF TOOL
---------------------------------------------
Android Package Manager built for Windows to:
* View packages on adb connected devices
* Allows adb connections through USB or WiFi. Watches and TVs are great for wifi connection, and mobile devices great for usb connection.
* Disables a very specific set of packages.

---------------------------------------------
ENSURE DEVICE IS ENABLED FOR ADB DEBUGGING
---------------------------------------------
To effectively use this package manager, ensure the following has been done:

1. Enable developer options on your device by tapping build number on your phone 7 times
2. Open the developer options and ensure that USB debugging or WiFi debugging is enabled
3. Ensure that Android USB drivers are installed on the computer
4. When using connection over USB: Connect the device to a computer by USB and authorize the computer for adb debugging on the phone when it pops up
5. Keep all the app files together in the same folder
6. Navigate to that folder in Windows command prompt and then run the android_package_manager.bat file

---------------------------------------------
PACKAGES THAT THE TOOL DISABLES AND ENABLES
---------------------------------------------

	oneui 3.1 packages on phone or tablet
	-------------------------------------
	com.samsung.android.calendar
	com.samsung.android.kidsinstaller
	com.samsung.android.app.settings.bixby
	com.sec.android.daemonapp
	com.samsung.systemui.bixby2
	com.samsung.android.bixby.service
	com.samsung.android.messaging
	com.samsung.android.bixby.agent
	com.samsung.android.app.reminder
	com.sec.android.app.clockpackage
	com.samsung.android.app.routines
	com.samsung.android.authfw
	com.samsung.android.bixbyvision.framework
	com.samsung.android.bixby.wakeup
	com.samsung.android.samsungpass
	com.samsung.android.app.spage
	com.samsung.android.visionintelligence
	com.samsung.android.svoiceime
	com.samsung.android.samsungpassautofill
	com.samsung.android.tapack.authfw
	com.samsung.android.bixby.agent.dummy

	oneui 3.0 packages on wear os watch like Galaxy Watch 4:
	--------------------------------------------------------
	com.samsung.android.app.reminder
	com.samsung.android.bixby.agent
	com.samsung.android.bixby.wakeup
	com.samsung.android.calendar
	com.samsung.android.messaging
	com.samsung.android.watch.alarm
	com.samsung.android.watch.stopwatch
	com.samsung.android.watch.timer
	com.samsung.android.watch.watchface.analogmodular
	com.samsung.android.watch.watchface.analoguefont
	com.samsung.android.watch.watchface.animal
	com.samsung.android.watch.watchface.aremoji
	com.samsung.android.watch.watchface.basicclock
	com.samsung.android.watch.watchface.bitmoji
	com.samsung.android.watch.watchface.companionhelper
	com.samsung.android.watch.watchface.digitalfont
	com.samsung.android.watch.watchface.digitalmodular
	com.samsung.android.watch.watchface.dualwatch
	com.samsung.android.watch.watchface.emergency
	com.samsung.android.watch.watchface.endangeredanimal
	com.samsung.android.watch.watchface.intrepid
	com.samsung.android.watch.watchface.large
	com.samsung.android.watch.watchface.myphoto
	com.samsung.android.watch.watchface.mystyle
	com.samsung.android.watch.watchface.premiumanalog
	com.samsung.android.watch.watchface.simpleanalogue
	com.samsung.android.watch.watchface.simplebasic
	com.samsung.android.watch.watchface.simpleclassic
	com.samsung.android.watch.watchface.simplecomplication
	com.samsung.android.watch.watchface.superfiction
	com.samsung.android.watch.watchface.tickingsound
	com.samsung.android.watch.watchface.together
	com.samsung.android.watch.watchface.typography
	com.samsung.android.watch.weather
	com.samsung.android.watch.worldclock
	com.samsung.android.wear.calculator

	fossil wear os 2 Packages
	-------------------------
	com.fossil.elabel
	com.fossil.twm
	com.fossil.wearable.pusher
	com.fossil.wearable.fspropertyutils
	com.fossil.activationanalytic
	com.fossil.oemsetup.triggerfish
	com.fossil.hfpconnector
	com.fossil.wearables.sk
	com.fossil.wearables.healthtracker
	com.fossil.wearos.sensoraccessservice
	com.fossil.phone
	com.fossil.charge.darter
	com.fossil.wearables.savedfaceservice
	com.fossil.wearables.batterysaver
	com.fossil.oemsetup.darter

---------------------------------------------
BUGS TO FIX
---------------------------------------------
1. Handle blank ENTER responses so that the tool does not throw an error. This applies to main menu, connection screen, and disconnection screen
2. Hide error commands for packages that are not installed on the device connected during the disabling and enabling process

---------------------------------------------
FUTURE FEATURES
---------------------------------------------
1. Allow user to select active packages from the packages on the device for disabling
1. Allow user to select inactive packages from the packages on the device for enabling