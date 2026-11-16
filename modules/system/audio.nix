{ config, pkgs, ... }:

{
  security.rtkit.enable = true;

  services.pipewire = {
  	enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
		extraConfig.pipewire = {
			"98-crackling-fix" = {
				"context.properties" = {
				"default.clock.quantum" = 2048;
				"default.clock.min-quantum" = 2048;
				"default.clock.max-quantum" = 8192;
				};
			};
		};
		wireplumber.extraConfig = {
			"99-crackling-fix" = {
				"api.alsa.period.size" = 2048;
				"api.alsa.headroom" = 8192;
			};
		};
  };
}
