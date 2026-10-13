{ config, pkgs, lib, ... }: 

let
    dotfilesPath = "${config.home.homeDirectory}/dotfile/.config";
    
    configDirs = [
	"niri"
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
 	home.sessionVariables.EDITOR = "nvim";

	imports = [ 
		./apps.nix
		./theme.nix
	];
   
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      spyder-workspace = "nh home switch /home/spyx/spyderOS/spyderos/desktop/.#spyx";
      spyder-update = "nh os switch /home/spyx/spyderOS/.#spyderos";
      spyder-clean = "nix-collect-garbage -d && home-manager expire-generations '-7 days'";
    };
  };
	
	programs.direnv = {
		enable = true;
		enableZshIntegration = true;
		nix-direnv.enable = true;
	};

  programs.home-manager.enable = true;

	xdg.userDirs = {
		enable = true;
		createDirectories = true;

		pictures = "${config.home.homeDirectory}/pictures/Pictures";
		#public = null;
		templates = null;
		music = null;
		#publicShare = null;
		videos = "${config.home.homeDirectory}/videos/Videos";

		extraConfig = {
			XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/pictures/Pictures/Screenshots";
		};
	};

	home.activation = {
    linkDmsGreeterCache = config.lib.dag.entryAfter ["writeBoundary"] ''
      # This script runs directly after Home Manager generates your home files
      # $DRY_RUN_CMD safely handles dry-runs (like nh os test)
      
      echo "Setting up dms-greeter cache symlinks..."
      $DRY_RUN_CMD sudo ln -sf /home/spyx/.config/DankMaterialShell/settings.json /var/cache/dms-greeter/settings.json
      $DRY_RUN_CMD sudo ln -sf /home/spyx/.local/state/DankMaterialShell/session.json /var/cache/dms-greeter/session.json
      $DRY_RUN_CMD sudo ln -sf /home/spyx/.cache/quickshell/dankshell/dms-colors.json /var/cache/dms-greeter/colors.json
    '';
  };

}
