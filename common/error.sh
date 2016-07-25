error() {
	NEWT_COLORS='
	  window=,red
	  border=white,red
	  textbox=white,red
	  button=black,white
	' \
	whiptail --title "$1" --msgbox "$2" 8 78
}
