{ pkgs, config, ...}:

{

  # Waybar Configuration
programs.waybar = {
  enable = true;
  systemd = {
    enable = true;
  };
};

home.file.".config/waybar/config".source = ./config;
home.file.".configs/waybar/style.css".source = ./style.css;

}
