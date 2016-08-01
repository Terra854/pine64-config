do_install_lubuntu() {
	if (whiptail --title "Install a Desktop Environment" --yesno "You are about to install the Lubuntu desktop. Are you sure?" 8 78) then {
		echo 'Dpkg::Progress-Fancy "1";' > /etc/apt/apt.conf.d/99progressbar
		
		trap 'error "Install a Desktop Environment" "Installation has been aborted."; return 1' INT
		
		apt update
		
		apt -y install \
			xserver-xorg-video-fbturbo \
			sunxi-disp-tool \
			libvdpau-sunxi \
			libump \
			libcedrus \
			# lubuntu-desktop package is not available for arm64
			# so this is a (very long) workaround for it
			abiword \
			alsamixergui \
			apport-gtk \
			audacious \
			audacious-plugins \
			blueman \
			desktop-file-utils \
			dmz-cursor-theme \
			evince \
			fcitx \
			fcitx-config-gtk2 \
			fcitx-frontend-gtk2 \
			fcitx-ui-classic \
			ffmpegthumbnailer \
			file-roller \
			firefox \
			fonts-nanum \
			fonts-noto-cjk \
			galculator \
			gdebi \
			gnome-disk-utility \
			gnome-keyring \
			gnome-mplayer \
			gnome-system-tools \
			gnome-time-admin \
			gnumeric \
			gpicview \
			gucharmap \
			guvcview \
			gvfs-backends \
			gvfs-fuse \
			hardinfo \
			indicator-application-gtk2 \
			language-selector-gnome \
			leafpad \
			libfm-modules \
			libgtk2-perl \
			libmtp-runtime \
			light-locker \
			light-locker-settings \
			lightdm-gtk-greeter-settings \
			lubuntu-default-session \
			lubuntu-software-center \
			lxappearance \
			lxappearance-obconf \
			lxinput \
			lxlauncher \
			lxpanel-indicator-applet-plugin \
			lxrandr \
			lxsession-default-apps \
			lxsession-logout \
			lxshortcut \
			lxtask \
			lxterminal \
			mobile-broadband-provider-info \
			modemmanager \
			mtpaint \
			network-manager-gnome \
			ntp \
			obconf \
			pidgin \
			pinentry-gtk2 \
			pm-utils \
			python3-aptdaemon.pkcompat \
			scrot \
			simple-scan \
			software-properties-gtk \
			sylpheed \
			sylpheed-doc \
			sylpheed-i18n \
			sylpheed-plugins \
			synaptic \
			system-config-printer-gnome \
			transmission \
			ubuntu-release-upgrader-gtk \
			update-notifier \
			usb-modeswitch \
			whoopsie \
			wvdial \
			x11-utils \
			xdg-user-dirs \
			xdg-user-dirs-gtk \
			xfburn \
			xfce4-notifyd \
			xfce4-power-manager \
			xfce4-power-manager-plugins \
			xpad \
			xul-ext-ubufox \
			xz-utils \
			# lubuntu-core package is not available for arm64
			# so this is a (very long) workaround for it
			alsa-base \
			alsa-utils \
			anacron \
			bc \
			ca-certificates \
			dbus-x11 \
			fonts-dejavu-core \
			fonts-freefont-ttf \
			foomatic-db-compressed-ppds \
			genisoimage \
			ghostscript-x \
			inputattach \
			libsasl2-modules \
			lightdm \
			lightdm-gtk-greeter \
			lubuntu-artwork \
			lubuntu-default-settings \
			lxpanel \
			lxsession \
			openbox \
			openprinting-ppds \
			pcmanfm \
			plymouth-theme-lubuntu-logo \
			plymouth-theme-lubuntu-text \
			printer-driver-pnm2ppa \
			rfkill \
			ubuntu-drivers-common \
			unzip \
			wireless-tools \
			wpasupplicant \
			xkb-data \
			xorg \
			xserver-xorg-input-all \
			xserver-xorg-video-all \
			zip \
			# Recommended packages for lubuntu-core
			avahi-daemon \
			bluez \
			bluez-cups \
			cups \
			cups-bsd \
			cups-client \
			cups-filters \
			fonts-guru \
			fonts-kacst-one \
			fonts-khmeros-core \
			fonts-lao \
			fonts-lklug-sinhala \
			fonts-sil-abyssinica \
			fonts-sil-padauk \
			fonts-takao-pgothic \
			fonts-thai-tlwg \
			fonts-tibetan-machine \
			fwupd \
			fwupdate \
			fwupdate-signed \
			hplip \
			kerneloops-daemon \
			laptop-detect \
			libnss-mdns \
			pcmciautils \
			policykit-desktop-privileges \
			printer-driver-brlaser \
			printer-driver-c2esp \
			printer-driver-foo2zjs \
			printer-driver-min12xxw \
			printer-driver-ptouch \
			printer-driver-pxljr \
			printer-driver-sag-gdi \
			printer-driver-splix \
			snapd \
			ttf-ancient-fonts-symbola \
			ttf-ubuntu-font-family
		
		if [ $? -eq 0 ]; then
			if (whiptail --title "Install a Desktop Environment" --yesno "This tool will now require a reboot in order to finish up the installation. Reboot now?" 8 78) then
				shutdown -r now
			fi
		elif [ $? -eq 1 ]; then
			error "Install a Desktop Environment" "ERROR: Looks like another process is using the package manager at the moment. Try again later. ($?)"
		else
			error "Install a Desktop Environment" "ERROR: An unknown error has been detected. ($?)"
		fi		
		return 0
	}
	else
		return 0
	fi
}
