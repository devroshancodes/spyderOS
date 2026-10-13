{ config, pkgs, inputs, ... }:

{
  programs.dms-shell = {
    enable = true;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    # Core features
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;

		package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
	
	services.displayManager.dms-greeter = {
		enable = true;
		compositor.name = "niri";
		configHome = "/home/spyx";
		compositor.customConfig = ''
			cursor {
	
				xcursor-theme "Bibata-Modern-Ice"
	
				xcursor-size 24
	
				hide-after-inactive-ms 10000
			}

// Input devices settings.
input {
	keyboard {
		
		xkb {
			layout "us"
		}
		
		// Enable numlock on startup. Omitting disables it.
		numlock
		}
	
	// Touchpad settings. Tap-to-click.
	touchpad {
		tap
		dwt
		}
	
		'';

	};
	
	systemd.services.greetd.environment = {
		XCURSOR_THEME = "Bibata-Modern-Ice";
		XCURSOR_SIZE = "24";
		XCURSOR_PATH = "/run/current-system/sw/share/icons";
	};
	
	programs.niri.enable = true;

}
