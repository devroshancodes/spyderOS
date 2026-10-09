{ config, pkgs, inputs, ... }: 
	let 
		unstable = import inputs.nixpkgs-unstable {
			system = pkgs.stdenv.hostPlatform.system;
			config.allowUnfree = true;
		};
	
	in
{
  home.packages = with pkgs; [
		adwaita-qt
		adwaita-qt6
		alacritty
		btop
		cava 
		chromium
		cliphist
		dconf
    foot
		glib
		inkscape
		kdePackages.breeze
		kdePackages.breeze-gtk
		kdePackages.dolphin
		kdePackages.qt6ct
		keepassxc
		kitty 
    libreoffice-fresh
		libsForQt5.qt5ct
		mpv
   	nautilus
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

	programs.obs-studio = {
		enable = true;
		plugins = with pkgs.obs-studio-plugins; [
			obs-pipewire-audio-capture
			wlrobs
			obs-backgroundremoval
		];
	};
}
