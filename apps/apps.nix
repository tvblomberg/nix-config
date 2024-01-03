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
    #pkgs.spotify
    pkgs.discord
    pkgs.podman-desktop
    pkgs.steam
    pkgs.dotnet-sdk
    pkgs.azure-functions-core-tools
    pkgs.pavucontrol
    pkgs.lens
    pkgs.remmina
    pkgs.networkmanagerapplet
    pkgs.gcc
    pkgs.bottles
    pkgs.brave
    pkgs.ollama
    pkgs.bitwarden
    pkgs.azure-cli
    pkgs.kubectl
    pkgs.powershell
    pkgs.rustup
    # Nvim stuff
    pkgs.fd
    pkgs.lazygit
    pkgs.tree-sitter
    pkgs.ripgrep
    pkgs.unzip
    pkgs.vimPlugins.rust-vim
    pkgs.lldb
    pkgs.steam-run
    pkgs.wlsunset
    pkgs.chatgpt-cli
    pkgs.spotify-tui
    pkgs.pass
    pkgs.gnome.seahorse
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
    ./shell/shell.nix
  ];


  xdg.desktopEntries."teams" = {
    name = "Teams";
    genericName = "Application";
    exec = "brave --app=https://teams.microsoft.com";
    terminal = false;
    categories = [ "Application" ];
    mimeType = [ "text/html" "text/xml" ];
    icon = ./teams.svg;
  };

  xdg.desktopEntries."chatgpt" = {
    name = "ChatGPT";
    genericName = "Application";
    exec = "brave --app=https://chat.openai.com";
    terminal = false;
    categories = [ "Application" ];
    mimeType = [ "text/html" "text/xml" ];
    icon = ./chatgpt.svg;
  };

  programs.thefuck.enable = true;

  /* tmux config */
  programs.tmux = {
      enable = true;
      keyMode = "vi";
  };

  # ChatGPT Token Secret
  age.secrets.spotify = {
    file = ../secrets/spotify.age;
  };


  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        username = "1270495496";
        device_name = "hal";
        password_cmd = "${pkgs.coreutils}/bin/cat ${config.age.secrets.spotify.path}";
      };
    };
  };

  #GPG for Pass
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";
  };

  services.gnome-keyring.enable = true;

}
