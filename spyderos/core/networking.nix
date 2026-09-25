{ config, pkgs, ... }: {
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "wpa_supplicant"; 
  environment.systemPackages = [ pkgs.networkmanagerapplet ];

	time.timeZone = "America/St_Vincent";
}
