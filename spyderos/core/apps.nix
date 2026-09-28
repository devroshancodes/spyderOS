{ config, pkgs, ... }: 

{
	environment.systemPackages = with pkgs; [
	adwaita-qt6 
	bibata-cursors
	cmake 
	compsize
	exfatprogs
	eza
	fastfetch 
	gcc 
	gnumake 
	gnutar
	go 
	hdparm
	iotop-c 
	kdePackages.qt6ct 
	kdePackages.qtstyleplugin-kvantum 
	lm_sensors
	lsof 
	meson 
	ninja 
	nmap
	ntfs3g
	nvme-cli
	pciutils 
	podman
	qemu
	ripgrep
	smartmontools 
	stow 
	strace 
	tcpdump
	traceroute
	unzip
	usbutils 
	uv 
	virt-manager 
	whois 
	zoxide 
  zip
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
  	flake = "/home/spyx/spyderOS/.#spyderos"; # Point to flake dir
	};
	
	programs.dconf = {
		enable = true;
	};

	environment.sessionVariables = {
  	NH_FLAKE = "/home/spyx/spyderOS/.#spyderos";
	};
}
