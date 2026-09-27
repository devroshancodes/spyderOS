{ config, pkgs, ... }:

{
   users.users.spyx = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    shell = pkgs.zsh; 
  };

  system.stateVersion = "26.05";
}
