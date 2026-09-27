{ config, pkgs, ... }: 

{
  home.packages = with pkgs; [
    firefox 
		chromium
		vivaldi
		vscode
		inkscape
		alacritty
		kitty 
    foot
		btop
		yazi
		mpv
		vlc
		cava 
    obs-studio
		shotcut
		transmission_4-gtk
		steam
		scrcpy
		wineWow64Packages.stable
		winetricks 
    libreoffice-fresh
		keepassxc
		remmina
		playerctl
		cliphist
  ];

	services.easyeffects = { 
		enable = true;
	};
}
