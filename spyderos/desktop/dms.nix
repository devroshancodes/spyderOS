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
}
