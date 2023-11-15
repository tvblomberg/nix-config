{ pkgs, config, ... }:

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
  ];


}
