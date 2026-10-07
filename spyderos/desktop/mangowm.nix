{ config, pkgs, inputs, ... }:

let
  # Your existing custom wrapper script or session
  mango-session = pkgs.writeShellScriptBin "mango-session" ''
    unset WAYLAND_DISPLAY
    unset DISPLAY
    export XDG_CURRENT_DESKTOP="mango"
    export XDG_SESSION_TYPE="wayland"
    export XDG_SESSION_DESKTOP="mango"

    ${pkgs.dbus}/bin/dbus-update-activation-environment --systemd --all
    ${pkgs.systemd}/bin/systemctl --user import-environment XDG_CURRENT_DESKTOP XDG_SESSION_TYPE XDG_SESSION_DESKTOP

    exec ${inputs.mangowm.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/mango "$@"
  '';
	in
{

  environment.systemPackages = [
    inputs.mangowm.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.foot 
		pkgs.wl-clipboard
		mango-session
  ];
  
	xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd}/bin/agreety -c ${mango-session}/bin/mango-session";
        user = "greeter";
      };
    };
  };
}
