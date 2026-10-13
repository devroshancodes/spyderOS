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
		compositor.name = "mangowc";
		configHome = "/home/spyx";
	};
	
	systemd.services.greetd.environment = {
		XCURSOR_THEME = "Bibata-Modern-Ice";
		XCURSOR_SIZE = "24";
		XCURSOR_PATH = "/run/current-system/sw/share/icons";
	};
	
	programs.niri.enable = true;

}
