{ config, inputs, pkgs, ... }:

{
	imports = [ inputs.mango.nixosModules.mango ];

	programs.mango = {
		enable = true;
	};

	xdg.portal = {
    enable = true;
    wlr = {
			enable = true;
			settings = {
				screencast = {
					chooser_type = "dmenu";
					chooser_cmd = "${pkgs.rofi}/bin/rofi -dmenu -p 'Share'";
				};
			};
		};
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config = {
			common = {
			default = [ "wlr" "gtk" ];
			"org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
			"org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
			};
		};
  };

	environment.sessionVariables = {
  	XDG_CURRENT_DESKTOP = "mango";
 	 XDG_SESSION_TYPE = "wayland";
	};
}
