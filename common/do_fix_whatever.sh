do_fix_whatever() {
	bash <(curl -s https://raw.githubusercontent.com/longsleep/build-pine64-image/master/simpleimage/platform-scripts/pine64_fix_whatever.sh)
	if [ $? == 0 ]; then
		whiptail --title "Fix All Problems" --msgbox "Alright! All problems have been fixed!" 8 78
	else
		error "Fix All Problems" "ERROR: Something nasty happened. Try again later."
	fi
	return 0
}
