{ pkgs, config, ... }:

{

  # Rofi Configuration
  programs.rofi = {
    enable = true;
    theme = ./palenight.rasi;
  };
}
