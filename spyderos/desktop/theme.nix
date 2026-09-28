{ pkgs, ... }:

{
  # GTK Theming
  gtk = {
    enable = true;

    # GTK 2/3/4 Theme
    theme = {
      name = "adw-gtk3-dark"; # Or "Orchis-Dark", "Catppuccin-Mocha-Standard-Blue-Dark", etc.
      package = pkgs.adw-gtk3;
    };

    # Icon Theme
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    # Cursor Theme
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 16;
    };

    # Font Settings
    /*font = {
     	name = "Sans";
      size = 11;
    };
		*/
    
		# Force GTK4 apps to follow dark theme
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  # Set cursor pointer globally for X11/Wayland fallbacks
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 16;
  };

	# Qt Theming
  qt = {
    enable = true;

    # Platform theme integration
    platformTheme.name = "qtct"; # Integrates Qt apps with GTK theme settings
	  
		# Style engine
    style = {
      name = "adwaita-dark"; # Uses Adwaita style engine to mirror GTK
      package = pkgs.adwaita-qt;
    };
  };

  # Ensure required integration packages are installed in user environment
  home.packages = with pkgs; [
    glib # Provides gsettings schema utilities for GTK
    dconf # Stores desktop settings for GTK/GNOME apps
  ];

}

