do_about() {
	whiptail --title "About pine64-config" --msgbox "\
	Pine64 Configuration Tool \n
	Copyright (c) 2016 Ben Tinner <bentinner@yahoo.com.sg>
	Licensed under the terms of the MIT License \n
	This tool provides a straight-forward way to 
	configure your Pine64. Although it can be run
	at any time, some of the options may have difficulties if
	you have heavily customised your installation.\n
	This tool is based on raspi-config by Alex Bradbury
	<asb@asbradbury.org> for the Raspberry Pi.
	" 20 70 1
	return 0
}
