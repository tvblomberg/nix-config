{ pkgs, config, inputs, ... }:

{
  # Packages that support the Home Environment
  home.packages = [
    pkgs.swww
    pkgs.wl-screenrec
    pkgs.hyprkeys
    pkgs.swaylock-effects
  ];

  services.flameshot.enable = true;

  imports = [
    # Hyprland Window Manager
    ./hyprland/hyprland.nix
    # App Launcher
    ./rofi/rofi.nix
    # GTK Configuration for GTK Apps
    ./gtk/gtk.nix
    # Notification Daemon
    ./dunst/dunst.nix
    # Home bar configuration
    ./waybar/waybar.nix
    # Logout Configuration
    ./wlogout/wlogout.nix
    # Clipboard Management
    ./clipman/clipman.nix
    # Remap Keys
    inputs.xremap-flake.homeManagerModules.default
  ];

  services.xremap = {
    withHypr = true;
    #withWlroots = true;
    yamlConfig = ''
modmap:                                                                                                                                                                                       
  - name: Default
    remap: # Required
      # Replace a key with another
      KEY_CAPSLOCK: KEY_LEFTMETA # Required
    '';
  };
}
