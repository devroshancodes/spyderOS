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

	# Enable Avahi for network printer discovery
	services.avahi = {
  	enable = true;
  	nssmdns4 = true;
  	openFirewall = true;
	};

	services.printing = {
		enable = true;
	};
	
	systemd.services.flake-update = {
		serviceConfig = {
			Type = "oneshot";
			User = "spyx";
			WorkingDirectory = "/home/spyx/spyderOS";
		};
		path = [ pkgs.nix pkgs.git ];
		script = ''
			nix --extra-experimentl-features 'nix-command flakes' flake update nixpkgs
		'';
	};

	systemd.services.nixos-upgrade = {
  	wants = [ "flake-update.service" ];
  	after = [ "flake-update.service" ];
	};
		
	system.autoUpgrade = {
    enable = true;
    flake = "/home/spyx/spyderOS#spyxnix"; # Ensure this points to your actual flake directory on disk
    flags = [ "-L" ];

    # Update exactly on Mon at 07:00:00 local time
    dates = "Mon *-*-* 07:00:00"; 

    # Spread the download load across a 15-minute window
    randomizedDelaySec = "15min"; 
  };
	
	services.fwupd.enable = true;

	nix.settings = {
		experimental-features = [ "nix-command" "flakes" ];
		auto-optimise-store = true;

  # Bypasses sudo requirement for builds
		trusted-users = [ "root" "spyx" ];
	};

}
