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
			hotkey-overlay {
				skip-at-startup
			}

			cursor {
	
				xcursor-theme "Bibata-Modern-Ice"
	
				xcursor-size 16
	
				hide-after-inactive-ms 10000
			}
		'';
	};
	
	systemd.services.greetd.environment = {
		XCURSOR_THEME = "Bibata-Modern-Ice";
		XCURSOR_SIZE = "16";
		XCURSOR_PATH = "/run/current-system/sw/share/icons";
	};
	
	programs.niri.enable = true;

}
