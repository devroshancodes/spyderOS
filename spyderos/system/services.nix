{ config, pkgs, ... }:

{
	services.logind.settings.Login = {
			HandlePowerKey="suspend";
			KillUserProcesses=false;
	};

	services.upower.enable = true;
	
	services.flatpak.enable = true;

	services.sunshine = {
		enable = true;
		openFirewall = true;
	};
	
	security.auditd.enable = true;	
	systemd.services.disable-xhc-wakeup	= {
		description = "Disable XHC sleep wakeup trigger";
  	wantedBy = [ "multi-user.target" ];
  	serviceConfig = {
    	Type = "oneshot";
    	ExecStart = "${pkgs.bash}/bin/bash -c 'echo XHC > /proc/acpi/wakeup'";
    	RemainAfterExit = true;
		};
  };

	security.audit = {
		enable = true;
	};
	
	services.openssh = {
		enable = true;
		settings = {
			PermitRootLogin = "no";
			PasswordAuthentication = false;
		};
	};

	nix.settings = {
		experimental-features = [ "nix-command" "flakes" ];
		auto-optimise-store = true;

  # Bypasses sudo requirement for builds
		trusted-users = [ "root" "spyx" ];
	};

}
