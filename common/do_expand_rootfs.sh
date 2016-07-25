do_expand_rootfs() {
	/usr/local/sbin/resize_rootfs.sh
	whiptail --title "Expand Filesystem" --msgbox "Expansion successful!" 8 78
	return 0
}
