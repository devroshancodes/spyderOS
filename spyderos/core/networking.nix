{ config, pkgs, ... }: 

{
	networking.hostName = "spyxnix";

	networking.networkmanager.enable = true;
 
	networking.networkmanager.wifi.backend = "wpa_supplicant"; 
 
	environment.systemPackages = [ pkgs.networkmanagerapplet ];

	networking.firewall = {
		enable = true;
		
		allowedTCPPorts = [ ];
		
		allowedUDPPorts = [ ];

		#trustedInterfaces = [];
	};


	time.timeZone = "America/St_Vincent";
}
