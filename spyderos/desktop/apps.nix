{ config, pkgs, inputs, ... }: 
	let 
		unstable = import inputs.nixpkgs-unstable {
			system = pkgs.stdenv.hostPlatform.system;
			config.allowUnfree = true;
		};
	
	in
{
  home.packages = with pkgs; [
		alacritty
		btop
		cava 
		chromium
		cliphist
		unstable.firefox-bin 
    foot
		inkscape
		kdePackages.dolphin
		keepassxc
		kitty 
    libreoffice-fresh
		mpv
   	nautilus
	 	obs-studio
		playerctl
		remmina
		scrcpy
		shotcut
		transmission_4-gtk
		vivaldi
		vlc
		vscode
		wineWow64Packages.stable
		winetricks 
		yazi
  ];

	services.easyeffects = { 
		enable = true;
	};
}
