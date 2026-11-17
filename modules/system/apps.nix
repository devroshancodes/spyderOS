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
	gnome-clocks
	gnumake 
	gnutar
	go 
	hdparm
	iotop-c 
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
				serif     = [ "Liberation Sans" "Noto Serif" "Noto Color Emoji" ];
				monospace = [ "Fira Code Mono" "Noto Sans Mono" "Noto Color Emoji" ];
			};
		};
  };

	#programs.ssh.startAgent = true;
	environment.sessionVariables = {
  	NH_FLAKE = "${userHome}/spyderOS";
		NIXOS_OZONE_WL = "1";
	};

}
