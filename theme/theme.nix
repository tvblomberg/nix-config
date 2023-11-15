{ pkgs, config, inputs, ... }:
let
 base16Theme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;
 gtkTheme = "gruvbox-dark";
 gtkThemePackage = pkgs.gruvbox-dark-gtk;
in
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = base16Theme;

  # GTK
   gtk = {
    enable = true;

    iconTheme = {
      name = "oomox-gruvbox-dark";
      package = pkgs.gruvbox-dark-icons-gtk;
    };

    theme = {
      name = "${gtkTheme}";
      package = gtkThemePackage;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.sessionVariables.GTK_THEME = "${gtkTheme}"; 


}
