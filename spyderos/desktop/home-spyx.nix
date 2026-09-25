{ config, pkgs, lib, ... }: 

let
    dotfilesPath = "${config.home.homeDirectory}/dotfile/.config";
    
    configDirs = [
	"mango"
	"kitty"
	"nvim"
	"alacritty"
	"quickshell"
	"DankMaterialShell"
	"dms"
	"danksearch"
	"dgop"
	"btop"
	"cava"
	"easyeffects"
	"fish"
	"foot"
	"gammastep"
	"GIMP"
	"joplin-desktop"
	"libreoffice"
	"mpv"
	"obs-studio"
	"qt6ct"
	"qt5ct"
	"sunshine"
	"xdg-desktop-portal"
	"xdg-desktop-portal-wlr"
	"yazi"
	"ytdlp-gui"
    ];
 in
  {
    xdg.configFile = builtins.listToAttrs (map (dir: {
      name = dir;
      value = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/${dir}";
	};
	}) configDirs);
  
  home.username = "spyx";
  home.homeDirectory = "/home/spyx";
  home.stateVersion = "26.05";
  imports = [ ./apps.nix ];
   
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      spyder-workspace = "home-manager switch --flake /home/spyx/spyderOS/spyderos/desktop/#spyx";
      spyder-update = "nixos-rebuild switch --flake /home/spyx/spyderOS/.#spyderos --sudo";
      spyder-clean = "nix-collect-garbage -d && home-manager expire-generations '-7 days'";
    };
  };

  programs.home-manager.enable = true;
}
