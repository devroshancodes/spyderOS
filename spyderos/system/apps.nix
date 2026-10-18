{ config, pkgs, lib, ... }:
	
	let
  	# Finds the first user account where 'isNormalUser = true' is declared
  	normalUsers = lib.filterAttrs (name: user: user.isNormalUser) config.users.users;
  	firstUser = builtins.elemAt (builtins.attrNames normalUsers) 0;
  	userHome = "/home/${firstUser}";

	in
{
	environment.systemPackages = with pkgs; [
	brightnessctl
	bibata-cursors
	cmake 
	compsize
	direnv
	exfatprogs
	eza
	fastfetch 
	gcc 
	gnumake 
	gnutar
	go 
	hdparm
	iotop-c 
	lm_sensors
	lsof 
	meson 
	ninja 
	nix-direnv
	nmap
	ntfs3g
	nvme-cli
	pciutils 
	podman
	pwvucontrol
	qemu
	ripgrep
	rofi
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
	wl-clipboard
	wlr-randr
	zoxide 
  zip
  ];

	environment.variables = {
		XCURSOR_THEME = "Bibata-Modern-Ice";
		XCURSOR_SIZE = "14";
	};


  fonts.packages = with pkgs; [
  comfortaa
	corefonts
	nerd-fonts.fira-code 
	noto-fonts-color-emoji
  source-code-pro
	vista-fonts
	];
  
	programs.zsh.enable = true;
	programs.localsend.enable = true;
	programs.kdeconnect.enable = true;
	programs.git.enable = true;
	
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
  	clean = {
			enable = true;
			dates = "weekly"; 
  		extraArgs = "--keep-since 2d --keep 2";
		}; 

		flake = "${userHome}/spyderOS"; # Point to flake dir
	};
	
	programs.dconf = {
		enable = true;
	};
	
	#programs.ssh.startAgent = true;
	environment.sessionVariables = {
  	NH_FLAKE = "${userHome}/spyderOS";
		NIXOS_OZONE_WL = "1";
	};
}
