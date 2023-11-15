{ config, pkgs, ... }:

{
  # Allow Unfree
  nixpkgs.config.allowUnfree = true;
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "invincent";
  home.homeDirectory = "/home/invincent";

  # Just don't change it
  home.stateVersion = "22.11"; # Please read the comment before changing.
  
  # Enable Font Config
  fonts.fontconfig.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # Fonts
    pkgs.noto-fonts
    pkgs.nerdfonts
  ];

  imports = [
    # Theme Setup
    ./theme/theme.nix

    # Setup Window Manager OR Desktop Environment
    ./home-environment/home-environment.nix

    # Setup Applications
    ./apps/apps.nix
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_CURRENT_DESKTOP = "sway";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
