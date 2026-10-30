{ config, pkgs, ... }:

{
   users.users.spyx = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "greeter" "wireshark" ];
    shell = pkgs.zsh; 
  };

	users.users.greeter = {
		extraGroups = [ "video" ];
	};

  system.stateVersion = "26.05";
}
