{ pkgs, ... }:

{
  # GTK Theming
  gtk = {
    enable = true;

    # GTK 2/3/4 Theme
    theme = {
      name = "adw-gtk3"; # Or "Orchis-Dark", "Catppuccin-Mocha-Standard-Blue-Dark", etc.
      package = pkgs.adw-gtk3;
    };

    # Icon Theme
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };

    # Cursor Theme
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 14;
    };

      
		# Force GTK4 apps to follow dark theme
   /* gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };*/
  };


  # Set cursor pointer globally for X11/Wayland fallbacks
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 14;
  };

	# Qt Theming
  qt = {
    enable = true;
    # Platform theme integration
    platformTheme.name = "qtct"; # Integrates Qt apps with GTK theme settings
	};

}

