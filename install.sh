#!/bin/bash

if [ $(id -u) -ne 0 ]; then
  printf "This install script needs to be run as root.\n"
  exit 1
fi

if [ -z "$1" ]; then {
	echo "ERROR: No arguments specified (ubuntu, debian or opensuse)"
	exit 1
}

elif [ $1 = "ubuntu" ]; then {
	printf "" # Do nothing
}

elif [ $1 = "debian" ]; then {
	printf "" # Do nothing
}

elif [ $1 = "opensuse" ]; then {
	echo "ERROR: The tool is not compatible with openSUSE at this time."
	exit 1
}

else {
	echo "ERROR: Unknown distribution specified."
	exit 1
}
fi

touch pine64-config.sh
printf "#!/bin/bash\n \n" >> pine64-config.sh

if [ $1 = "ubuntu" ]; then {
	cat ubuntu/*.sh common/*.sh main.sh >> pine64-config.sh
}

elif [ $1 = "debian" ]; then {
	cat debian/*.sh common/*.sh main.sh >> pine64-config.sh
}
fi

if [ -e "/usr/local/sbin/pine64-config.sh" ]
then
	rm /usr/local/sbin/pine64-config.sh
fi

chmod a+x pine64-config.sh
cp pine64-config.sh /usr/local/sbin
printf "\nInstallation finished. You can now execute the configuration tool with: \n \n    'sudo pine64-config.sh'\n \n"

rm pine64-config.sh
