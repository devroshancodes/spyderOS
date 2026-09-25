{ config, pkgs, ... }:

{
  networking.hostName = "spyxnix";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true; 

  # Bypasses sudo requirement for builds
  nix.settings.trusted-users = [ "root" "spyx" ];

  users.users.spyx = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    shell = pkgs.zsh; 
  };

  system.stateVersion = "26.05";
}
