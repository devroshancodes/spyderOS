{ config, pkgs, lib, ... }:
	
	let
  	# Finds the first user account where 'isNormalUser = true' is declared
  	userHome = "/home/${config.spyderos.user.name}";

	in
{
	environment.systemPackages = with pkgs; [
	bibata-cursors
	brightnessctl
	cmake 
	compsize
	direnv
	exfatprogs
	eza
	fastfetch
	ffmpeg
	gcc
	gnome-clocks
	gnumake 
	gnutar
	go 
	hdparm
	intel-gpu-tools
	iw
	iotop-c
	jq
	lm_sensors
	lsof
	man-pages
	man-pages-posix
	meson 
	ninja 
	nix-direnv
	nmap
	ntfs3g
	nvme-cli
	p7zip
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
	tree
	unzip
	usbutils 
	uv 
	virt-manager 
	whois
	wl-clipboard
	wlr-randr
	yt-dlp
	zoxide 
  zip
  ];

	environment.variables = {
		XCURSOR_THEME = "Bibata-Modern-Ice";
		XCURSOR_SIZE = "14";
	};


  fonts = { 
		packages = with pkgs; [
  		comfortaa
			corefonts
			nerd-fonts.fira-code 
			noto-fonts
			noto-fonts-cjk-sans
			noto-fonts-color-emoji
  		source-code-pro
			vista-fonts
		];
		fontconfig = {
			enable = true;
			defaultFonts = {
				sansSerif = [ "Liberation Sans" "Noto Sans Egyptian Hieroglyphs" "Noto Sans" "Noto Color Emoji" ];
				serif     = [ "Liberation Serif" "Noto Serif" "Noto Color Emoji" ];
				monospace = [ "FiraCode Nerd Font" "Noto Sans Mono" "Noto Color Emoji" ];
			};
		};
  };

	#programs.ssh.startAgent = true;
	environment.sessionVariables = {
  	NH_FLAKE = "${userHome}/spyderOS";
		NIXOS_OZONE_WL = "1";
	};

}
