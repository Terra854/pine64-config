if [ $(id -u) -ne 0 ]; then
  printf "This script needs to be run as root. Try 'sudo pine64-config'\n"
  exit 1
fi

eval `resize`

while true; do
  FUN=$(whiptail --title "Pine64 Software Configuration Tool (pine64-config)" --menu "Hello there. What do you want to do today?" $LINES $COLUMNS $(( $LINES - 8 )) --cancel-button Exit --ok-button Select \
    "1 Expand Filesystem" "Ensures that all of the SD card storage is available to the OS" \
    "2 Fix All Problems" "This option will fix all kinds of problems that may occur on the Pine64" \
    "3 Install a Desktop Environment" "Set up a graphical environment on your Pine64" \
    "4 Update Linux Kernel" "Checks for a new version of the kernel and if there is, updates it." \
    "h About pine64-config" "Information about this configuration tool" \
    3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 1 ]; then
    exit 0
  elif [ $RET -eq 0 ]; then
    case "$FUN" in
      1\ *) do_expand_rootfs ;;
      2\ *) do_fix_whatever ;;
      3\ *) do_select_desktop_environment ;;
      4\ *) do_update_kernel ;;
      h\ *) do_about ;;
      *) whiptail --msgbox "ERROR: The option is invalid" 20 60 1 ;;
    esac || whiptail --msgbox "There was an error running option $FUN" 20 60 1
  else
    exit 1
  fi
done

