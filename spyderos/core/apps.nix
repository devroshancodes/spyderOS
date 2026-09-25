{ config, pkgs, ... }: {
  
	environment.systemPackages = with pkgs; [
   bibata-cursors
	 kdePackages.qt6ct kdePackages.qtstyleplugin-kvantum adwaita-qt6
	 pciutils usbutils iotop-c strace lsof hdparm smartmontools 
    compsize nvme-cli lm_sensors podman qemu virt-manager 
    zip unzip gnutar ntfs3g exfatprogs nmap tcpdump traceroute whois 
  ];

	environment.variables = {
		XCURSOR_THEME = "Bibata-Modern-Classic";
		XCURSOR_SIZE = "14";
	};


  fonts.packages = with pkgs; [
  comfortaa source-code-pro nerd-fonts.fira-code noto-fonts-color-emoji
  ];
  
	programs.zsh.enable = true;
	programs.localsend.enable = true;
	programs.kdeconnect.enable = true;

	qt = {
		enable = true;
		platformTheme = "qt5ct";
	};

}
