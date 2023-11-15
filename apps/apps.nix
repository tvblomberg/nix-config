{ pkgs, config, ... }:

{

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
  ];

  imports = [
    ./git/git.nix
    ./vscode/vscode.nix
    ./kitty/kitty.nix
    ./bash/bash.nix
  ];

}
