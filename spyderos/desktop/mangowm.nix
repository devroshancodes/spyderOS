{ config, pkgs, inputs, ... }: {
  environment.systemPackages = [
    inputs.mangowm.packages.${pkgs.system}.default
    pkgs.foot pkgs.wl-clipboard
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
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd mango";
        user = "greeter";
      };
    };
  };
}
