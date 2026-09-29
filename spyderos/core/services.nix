{ config, pkgs, ... }:

{
	services.logind.settings.Login = {
			HandlePowerKey="suspend";
			KillUserProcesses=true;
	};
	services.upower.enable = true;
	#services.displayManager.dms-greeter = {
	#enable = true;
	#compositor.name = "mangowc";
	#};
	
	services.flatpak.enable = true;

	services.sunshine = {
		enable = true;
		openFirewall = true;
	};

	nix.settings = {
		experimental-features = [ "nix-command" "flakes" ];
		auto-optimise-store = true;

  # Bypasses sudo requirement for builds
		trusted-users = [ "root" "spyx" ];
	};
}
