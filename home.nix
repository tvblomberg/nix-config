{ config, pkgs, ... }:

{
  # Allow Unfree
  nixpkgs.config.allowUnfree = true;
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "invincent";
  home.homeDirectory = "/home/invincent";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.
  
  # Enable Font Config
  fonts.fontconfig.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.neovim
    pkgs.font-awesome
    pkgs.firefox
    pkgs.noto-fonts
    pkgs.nerdfonts
    pkgs.distrobox
    pkgs.podman
    pkgs.obsidian
    pkgs.jetbrains.rider
    pkgs.spotify
    pkgs.discord
    pkgs.swww
    pkgs.watershot
    pkgs.wl-screenrec
    pkgs.hyprkeys
    pkgs.swaylock-effects
    pkgs.podman-desktop
    pkgs.steam
    pkgs.xfce.thunar
    pkgs.dotnet-sdk
    pkgs.azure-functions-core-tools
  ];

  imports = [
    ./hyprland/hyprland.nix
    ./rofi/rofi.nix
    ./gtk/gtk.nix
    ./dunst/dunst.nix
    ./waybar/waybar.nix
  ];


  # Logout
  programs.wlogout = {
    enable = true;
  };

  # Clipboard Management
  services.clipman = {
    enable = true;
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

 # VS Code
  programs.vscode = {
    enable = true;
  };

  # Git Configuration
  programs.git = {
    enable = true;
    userEmail = "thomas.v.blomberg@gmail.com";
    userName = "Thomas V. Blomberg";
  };

  # Bash Configuration
  programs.bash = {
    enable = true;
    shellAliases = {
      vim = "nvim";
    };
  };

  # Kitty Configuration
  programs.kitty = {
    enable = true;
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
