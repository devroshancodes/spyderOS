{ config, pkgs, ... }:
{
programs.zsh.enable = true;
	
	programs.localsend.enable = true;
	
	programs.kdeconnect.enable = true;
	
	programs.git = {
  	enable = true;
  	config.safe.directory = [ "/home/spyx/spyderOS" ];
	};
	
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
	
	programs.wireshark = {
		enable = true;
		package = pkgs.wireshark; 
		dumpcap.enable = true;
		usbmon.enable = true;
	};

	programs.appimage = {
		enable = true;
		binfmt = true;
	};

	documentation = {
		enable = true;
		man.enable = true;
		man.cache.enable = true;
	};
}
