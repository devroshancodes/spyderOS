{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

	boot.kernelParams = [ "mem_sleep_default=shallow" ];
}
