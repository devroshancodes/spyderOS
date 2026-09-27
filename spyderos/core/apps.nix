{ config, pkgs, ... }: 

{
	environment.systemPackages = with pkgs; [
  bibata-cursors
	eza
	zoxide 
	fastfetch 
	stow 
	uv 
	gcc 
	gnumake 
	cmake 
	ninja 
	meson 
	go 
	ripgrep
	kdePackages.qt6ct 
	kdePackages.qtstyleplugin-kvantum 
	adwaita-qt6 
	pciutils 
	usbutils 
	iotop-c 
	strace 
	lsof 
	hdparm
	smartmontools 
	compsize
	nvme-cli
	lm_sensors
	podman
	qemu
	virt-manager 
  zip
	unzip
	gnutar
	ntfs3g
	exfatprogs
	nmap
	tcpdump
	traceroute
	whois 
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
	
	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
		localNetworkGameTransfers.openFirewall = true;
		extraCompatPackages = with pkgs; [
			proton-ge-bin
		];
	};
	programs.nh = {
  	enable = true;
  	clean.enable = true;
  	clean.extraArgs = "--keep-since 4d --keep 3"; # Keep generations from the last 4 days, up to a max of 3
  	flake = "/home/spyx/spyderOS"; # Point to flake dir
	};

	qt = {
		enable = true;
		platformTheme = "qt5ct";
	};
}
