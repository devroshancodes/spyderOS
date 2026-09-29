{ config, pkgs, ... }: 

{
  home.packages = with pkgs; [
		alacritty
		btop
		cava 
		chromium
		cliphist
		firefox 
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
