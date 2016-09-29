if [ $(id -u) -ne 0 ]; then
	printf "This script needs to be run as root. Try 'sudo pine64-config'\n"
	exit 1
fi

GREEN='\033[1;32m'
RED='\033[1;31m'
DEPENDECIES="0"

echo "Checking for presence of required dependecies..."

echo -n "Checking for whiptail..."
if [ -x /bin/whiptail ]; then
	echo -e "${GREEN}OK\n"
else
	echo -e "${RED}Not Installed\n" && DEPENDECIES="1"
fi

echo -n "Checking for xterm..."
if [ -x /usr/bin/resize ]; then
	echo -e "${GREEN}OK\n"
else
	echo -e "${RED}Not Installed\n" && DEPENDECIES="1"
fi

if [ DEPENDECIES == 1 ]; then
	echo -e "\033[0;47m${RED}ERROR: One or more depedecies required for this script to run properly are not installed. Please install the missing dependecies and try again."
	exit 1
fi

eval `resize`

while true; do
  FUN=$(whiptail --title "Pine64 Software Configuration Tool (pine64-config)" --menu "Hello there. What do you want to do today?" $LINES $COLUMNS $(( $LINES - 8 )) --cancel-button Exit --ok-button Select \
    "1 Expand Filesystem" "Ensures that all of the SD card storage is available to the OS" \
    "2 Fix All Problems" "This option will fix all kinds of problems that may occur on the Pine64" \
    "3 Install a Desktop Environment" "Set up a graphical environment on your Pine64" \
    "4 Update Linux Kernel" "Checks for a new version of the kernel and if there is, updates it." \
	"5 Update Bootloader" "Checks for a new version of the bootloader and if there is, updates it." \
	"6 Set CPU Govenor Mode" "Set the CPU Govenor mode for the Pine64" \
	"7 Health Monitor" "Launches the health monitor for the Pine64" \
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
	  5\ *) do_update_uboot ;;
	  6\ *) do_cpu_governor ;;
	  7\ *) do_health ;;
      h\ *) do_about ;;
      *) whiptail --msgbox "ERROR: The option is invalid" 20 60 1 ;;
    esac || whiptail --msgbox "There was an error running option $FUN" 20 60 1
  else
    exit 1
  fi
done

