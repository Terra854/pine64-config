do_expand_rootfs() {
	DEVICE="/dev/mmcblk0"
	if [ ! -b "$DEVICE" ]; then
		error "Expand Filesystem" "ERROR: It seems that you are not running it on the Pine64."
		return 2
	fi
	/usr/local/sbin/resize_rootfs.sh
	whiptail --title "Expand Filesystem" --msgbox "Expansion successful!" 8 78
	return 0
}
