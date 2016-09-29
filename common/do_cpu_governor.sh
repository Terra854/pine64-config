do_cpu_governor() {
	if [ -x /usr/bin/cpufreq-set ]; then
		if [ -d /sys/devices/system/cpu/cpufreq/performance ]; then
			GOVERNOR="performance"
		elif [ -d /sys/devices/system/cpu/cpufreq/powersave ]; then
			GOVERNOR="powersave"
		elif [ -d /sys/devices/system/cpu/cpufreq/userspace ]; then
			GOVERNOR="userspace"
		elif [ -d /sys/devices/system/cpu/cpufreq/ondemand ]; then
			GOVERNOR="ondemand"
		elif [ -d /sys/devices/system/cpu/cpufreq/conserative ]; then
			GOVERNOR="conserative"
		elif [ -d /sys/devices/system/cpu/cpufreq/interactive ]; then
			GOVERNOR="interactive"
		fi

		FUN=$(whiptail --title "Set CPU Governor Mode" --menu "The governor is currently set to $GOVERNOR\n \n What mode would you like to set it to?" $LINES $COLUMNS $(( $LINES - 8 )) --cancel-button Exit --ok-button Select \
			"1 performance" "Always run your CPU at full speed. Not recommended if you are running on a battery." \
			"2 powersave" "Always run your CPU at the lowest possible speed. Useful if you want to conserve battery, but may cause issues with Gigabit Ethernet" \
			"3 userspace" "Let userspace utilities set the speed of your CPU (Not for the faint hearted)" \
			"4 ondemand" "Increases the CPU speed only when under heavy load. Recommended option if running on a battery, but may cause issues with Gigabit Ethernet" \
			"5 conserative" "CPU will gradually speed up or slow down depending on how much load the CPU is doing. May cause issues with Gigabit Ethernet" \
			"6 interactive" "Let the system decide what CPU speed to use. This is the default option" \
			3>&1 1>&2 2>&3)
		RET=$?
		if [ $RET -eq 1 ]; then
			exit 0
		elif [ $RET -eq 0 ]; then
			case "$FUN" in
				1\ *) set_governor performance ;;
				2\ *) set_governor powersave ;;
				3\ *) set_governor userspace ;;
				4\ *) set_governor ondemand ;;
				5\ *) set_governor conserative ;;
				h\ *) set_governor interactive ;;
				*) whiptail --msgbox "ERROR: The option is invalid" 20 60 1 ;;
			esac || whiptail --msgbox "There was an error running option $FUN" 20 60 1
		else
			exit 1
		fi
	else
		if (whiptail --title "Set CPU Governor Mode" --yesno "It seems that the tool required for this operation is not installed on your system. Do you want me to install it for you?" 8 78); then
			if ( $DISTRO -eq "ubuntu" || $DISTRO -eq "debian" ); then
				apt -y install cpufrequtils
				do_cpu_governor
			elif ( $DISTRO -eq "opensuse" ); then
				zypper -y install cpufrequtils
				do_cpu_governor
			fi
		else
			return 0
		fi
	fi
}

set_governor() {
	cpufreq-set -g $1
	if [ $? -eq 0 ]; then
		whiptail --title "Set CPU Governor Mode" --msgbox "SUCCESS. The CPU governor is set to $1" 8 78
		do_cpu_governor
	else
		error "Set CPU Governor Mode" "ERROR: Something nasty happened. Try again later."
		do_cpu_governor
	fi
}
