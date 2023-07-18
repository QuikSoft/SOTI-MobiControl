      ____   ___ _____ ___
     / ___! / _ \_   _!_ _!
     \___ \! ! ! !! !  ! !
      ___) ! !_! !! !  ! !
     !____/ \___/ !_! !___!

  == MobiControl Android Enterprise DO Enrollment ==
  v1.2

########################################################################################################################

This Tool is to make the manual enrollment of your Android Enterprise Device by using the ADB Method easier.
It can be used when your device has no Google Mobile Services or when Google Online Services are not available
because of network restrictions.

########################################################################################################################

Preperation


1. Extracting
After extracting the zip file copy the MCAEDO-Tool folder to the root of your c: drive. If you want to place it into a
different folder you need to adjust the paths in MCAEDO-Tool.bat.


2. Add the Android Enterprise Agent
- Download latest GoogleMobiControlxxxx_xxxx.apk from http://soti.net/apk/ae2
- Rename Agent to GoogleMobiControl.apk
- Copy Agent to the agent folder

3. Add the MCSetup.ini (Optional)
- Download your MCSetup.ini from your Add devices Rule
- Copy MCSetup.ini to the mcsetup folder

4. Add a shortcut to your desktop (Optional)
Place the MCAEDO-Tool.lnk shortcut on your desktop

########################################################################################################################

Enrollment Steps


1. Prepare your device

- Factory reset your device and skip any Setup Wizard
- Go to Settings > System > About device and tap the build number 7 times to enable developer mode
- Go to Developer Settings and enable USB-Debugging. The path to Developer Setting depends on the OEM
- Connect your device to your computer with an USB cable
- Now you will see an "Allow USB debugging?" notification on your device. Click ok to authorize
- Set your Wifi Connection
	NOTE: You might not be able to do this anymore after the Device Owner is set depending on the OEM


2. Use the tool

Open MCAEDO-Tool.bat or MCAEDO-Tool.lnk to start the tool.


[1] to check if the ADB connection between the device and your computer is established correctly. If everything is fine
you should get something similar to this:

	List of devices attached
	AB1234567489 device

If it says 'offline' or 'unauthorized' instead of 'device' check your connection or proceed the authorization
notification on the device.

When your connection is established correctly you can now continue with the next step.


[2] to Set the Wificonnect.
You are able to store the Wifi credentials in the running batch file. So you are able to stage multiple devices an you
just have to enter the credentials once. When the batch file is closed you need to set them again.

After setting the credentials you can push them to the device.

	NOTE: When uninstalling the ADBJoinWifi App your Wifi connection will be removed.


[3] Copy MCSetup.ini to the device.
This option will copy the MCSetup.ini to the 


[4] to install the device Android Enterprise agent on the device.
You might see a "Turn on Play Protect?" notification. You need to decline or accept to get the installation done.

	NOTE: Make sure to NOT start the MobiControl agent before step 5 is done or you will end with a work profile.


[5] to set the Device Owner.
It should respond with:

	Success: Device owner set to packge ...

Anything else means that there was an issue setting the Device Owner.
This might happen when there is already a device owner set on the device, Device Owner is disabled by the OEM or there
is already an account created on the device. And finally some devices might just not work for no reason.

	NOTE: Developer Mode is automatically disabled after the Device Owner is set.


When your device owner is set successfully you can close the tool and continue on the device.
The MobiControl Agent will start automatically. If you provided a MCSetup.ini the device will start enrollment to
MobiControl. Without a MCSetup.ini you need to enter your Enrollment ID manually.

	NOTE: If your device has no Google Mobile Services make sure to use "Skip Google Account Addition During
	Enrollment on Managed Android Devices" in your add devices rule.

########################################################################################################################

Version 1.2

Author and Credits
Christian Berberich
https://www.linkedin.com/in/christian-berberich-710b4518b/

The Wifi feature is using adb-join-wifi
https://github.com/steinwurf/adb-join-wifi

########################################################################################################################
