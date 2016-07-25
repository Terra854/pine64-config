do_select_desktop_environment() {
	  FUN=$(whiptail --title "Install a Desktop Environment" --menu "Which desktop environment would you like to install? (NOTE: Internet connection is required)" $LINES $COLUMNS $(( $LINES - 8 )) --cancel-button Back --ok-button Select \
	    "1 Ubuntu" "with the default Unity desktop" \
	    "2 Kubuntu" "Ubuntu with the K Desktop environment" \
	    "3 Xubuntu" "Ubuntu with the XFCE desktop environment" \
	    "4 Lubuntu" "Ubuntu that uses LXDE" \
	    "5 Ubuntu GNOME" "Ubuntu with the GNOME desktop environment" \
	    "6 Ubuntu MATE" "Ubuntu with the MATE desktop environment" \
	    "7 Ubuntu Studio" "Designed for multimedia editing and creation" \
	    3>&1 1>&2 2>&3)
	  RET=$?
	if [ $RET -eq 1 ]; then
		return 0
	elif [ $RET -eq 0 ]; then
		case "$FUN" in
			1\ *) do_install_ubuntu ;;
			2\ *) do_install_kubuntu ;;
			3\ *) do_install_xubuntu ;;
			4\ *) do_install_lubuntu ;;
			5\ *) do_install_ubuntu_gnome ;;
			6\ *) do_install_ubuntu_mate ;;
			7\ *) do_install_ubuntu_studio ;;
			*) whiptail --msgbox "ERROR: The option is invalid" 20 60 1 ;;
		esac || whiptail --msgbox "There was an error running option $FUN" 20 60 1
	fi
}
