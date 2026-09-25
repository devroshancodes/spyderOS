{ config, pkgs, ... }:

{
	services.logind.settings.Login = {
			HandlePowerKey="suspend";
			KillUserProcesses=true;
	};

	#services.displayManager.dms-greeter = {
	#enable = true;
	#compositor.name = "mangowc";
	#};
}
