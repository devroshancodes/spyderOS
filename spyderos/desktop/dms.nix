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
	};
	
	systemd.services.greetd.environment = {
		XCURSOR_THEME = "Bibata-Modern-Ice";
		XCURSOR_SIZE = "16";
	};
	
	systemd.tmpfiles.rules = [
		"L+ /var/cache/dms-greeter/settings.json ---- /home/spyx/.config/DankMaterialShell/settings.json"
		"L+ /var/cache/dms-greeter/session.json ---- /home/spyx/.config/DankMaterialShell/session.json"
		"L+ /var/cache/dms-greeter/dms-color.json ---- /home/spyx/.config/DankMaterialShell/dms-color.json"
	];
	
	programs.niri.enable = true;

}
