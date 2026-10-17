{ config, pkgs, lib, ... }: 

let
  dotfilesPath = "${config.home.homeDirectory}/dotfile/.config";  
  configDirs = [
		#"niri"
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
		"fastfetch"
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

	loupe = "org.gnome.Loupe.desktop";
	imageTypes = [
		"image/jpeg" 
		"image/png" 
		"image/gif" 
		"image/webp"
    "image/bmp" 
		"image/tiff" 
		"image/svg+xml" 
		"image/avif"
    "image/heic" 
		"image/jxl"
  ];
	
	vivaldi = "vivaldi-stable.desktop";
	webBrowser = [
	"x-scheme-handler/http"
	"x-scheme-handler/https"
	"text/html"
	];

 in
  {
		imports = [ 
			./default.nix
		];

    xdg.configFile = builtins.listToAttrs (map (dir: {
      name = dir;
      value = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/${dir}";
			};
		}) configDirs);
 	
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
	
		xdg.mimeApps = {
			enable = true;
			defaultApplications = 
				(lib.genAttrs imageTypes (_: loupe)) //
				(lib.genAttrs webBrowser (_: vivaldi));
			
		}; 

  	programs.zsh = {
    	enable = true;
    	enableCompletion = true;
    	syntaxHighlighting.enable = true;
    	shellAliases = {
      	spybuild = "nh os build";
      	spyupdate = "nh os switch";
			};

			initContent = ''
				if [[ -o interactive && -z "$FASTFETCH_SHOWN" ]]; then
					export FASTFETCH_SHOWN=1
					fastfetch
				fi
			'';
  	};
	
		programs.direnv = {
			enable = true;
			enableZshIntegration = true;
			nix-direnv.enable = true;
		};
	
		programs.zoxide = {
			enable = true;
			enableZshIntegration = true;
			options = [ "--cmd cd" ];
		};
  	
		programs.fastfetch.enable = true;

		programs.home-manager.enable = true;

  	home.username = "spyx";
  	home.homeDirectory = "/home/spyx";
  	home.stateVersion = "26.05";
}
