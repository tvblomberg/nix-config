{ pkgs, config, ... }:

{
  programs.btop.enable = true;

  home.packages = [
    pkgs.neovim
    pkgs.font-awesome
    pkgs.firefox
    pkgs.distrobox
    pkgs.podman
    pkgs.obsidian
    pkgs.jetbrains.rider
    pkgs.spotify
    pkgs.discord
    pkgs.podman-desktop
    pkgs.steam
    pkgs.xfce.thunar
    pkgs.dotnet-sdk
    pkgs.azure-functions-core-tools
    pkgs.pavucontrol
    pkgs.lens
    pkgs.remmina
    pkgs.networkmanagerapplet
    pkgs.gcc
    pkgs.bottles
    pkgs.brave
  ];

  home.file.".config" = {
    source = ./nvim;
    target = ".config/nvim";
    recursive = true;
  };

  imports = [
    ./git/git.nix
    ./vscode/vscode.nix
    ./kitty/kitty.nix
    ./bash/bash.nix
  ];

  xdg.desktopEntries."teams" = {
    name = "Teams";
    genericName = "Application";
    exec = "brave --app=https://teams.microsoft.com";
    terminal = false;
    categories = [ "Application" ];
    mimeType = [ "text/html" "text/xml" ];
  };

}
