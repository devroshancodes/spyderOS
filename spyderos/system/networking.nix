{ config, pkgs, ... }: 

{
	networking.hostName = "spyxnix";

	networking.networkmanager.enable = true;
 
	networking.networkmanager.wifi.backend = "wpa_supplicant"; 
 
	environment.systemPackages = [ pkgs.networkmanagerapplet ];

	networking.firewall = {
		enable = true;

		checkReversePath = "loose";
		
		allowedTCPPorts = [ 22 53 ];
		
		allowedUDPPorts = [ 53 67];

		#trustedInterfaces = [];
	};


	time.timeZone = "America/St_Vincent";
}
