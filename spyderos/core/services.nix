{ config, pkgs, ... }:

{
	services.logind = {
		extraConfig = ''
			[Login]
			HandlePowerKey=suspend
			KillUserProcesses=yes
			'';
	};
}
