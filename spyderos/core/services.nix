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
}
