{ config, pkgs, ... }: 

{
	networking.hostName = "spyxnix";

	networking.networkmanager.enable = true;
 
	networking.networkmanager.wifi.backend = "wpa_supplicant"; 
 
	environment.systemPackages = [ pkgs.networkmanagerapplet ];

	networking.firewall = {
		enable = true;
		
		allowedTCPPorts = [ 22 ];
		
		allowedUDPPorts = [ ];

		#trustedInterfaces = [];
	};


	time.timeZone = "America/St_Vincent";
}
