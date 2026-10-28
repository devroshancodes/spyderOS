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
		cliphist
		dconf
    foot
		glib
		inkscape
		kdePackages.breeze
		kdePackages.breeze-gtk
		kdePackages.dolphin
		kdePackages.qt6ct
		kdePackages.qqc2-desktop-style
		keepassxc
		kitty 
    libreoffice-fresh
		libsForQt5.qt5ct
		loupe
		moor
		mpv
   	nautilus
		playerctl
		qalculate-qt
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
	
	programs.chromium = {
		enable = true;
		commandLineArgs = [
			"--ozone-platform-hint=auto"
		
			"--ignore-gpu-blocklist" 
			"--enable-gpu-rasterization" 
			"--enable-zero-copy"

			"--enable-features=AccelerateVideoDecodeLinuxGL,AcceleratedVideoDecodeLinuxZeroCopyGL,VaapiVideoDecoder,VaapiIgnoreDriverChecks,QuickIntensiveWakeUpThrottlingAfterLoading"
		];
	};
			
}
