do_select_desktop_environment() {
	  FUN=$(whiptail --title "Install a Desktop Environment" --menu "Which desktop environment would you like to install? (NOTE: Internet connection is required)" $LINES $COLUMNS $(( $LINES - 8 )) --cancel-button Back --ok-button Select \
	    "1 GNOME 3" "Installs the GNOME environment" \
	    "2 KDE 5" "Installs the K Desktop environment" \
	    "3 Xfce 4" "Installs the XFCE desktop environment" \
	    "4 LxQt" "Installs the LxQt desktop environment" \
	    "5 MATE" "Installs the MATE desktop environment" \
		"6 Cinnamon" "Installs the Cinnamon desktop environment"
	    3>&1 1>&2 2>&3)
	  RET=$?
	if [ $RET -eq 1 ]; then
		return 0
	elif [ $RET -eq 0 ]; then
		case "$FUN" in
			1\ *) do_install_gnome ;;
			2\ *) do_install_kde ;;
			3\ *) do_install_xfce ;;
			4\ *) do_install_lxqt ;;
			5\ *) do_install_mate ;;
			6\ *) do_install_cinnamon ;;
			*) whiptail --msgbox "ERROR: The option is invalid" 20 60 1 ;;
		esac || whiptail --msgbox "There was an error running option $FUN" 20 60 1
	fi
}
