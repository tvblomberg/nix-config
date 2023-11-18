{ pkgs, config, ... }:

{

  # Kitty Configuration
  programs.kitty = {
    enable = true;
    theme = "Gruvbox Material Dark Hard";
  };

  programs.starship = {
    enable = true;
  };

}
