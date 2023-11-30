{ pkgs, config, ... }:

{

  # Logout
  programs.wlogout = {
    enable = true;
  };

  home.packages = [
    pkgs.waylock
  ];


  home.file."wlogout" = {
    enable = true;
    target = ".config/wlogout/layout";
    source = ./layout;
  };

}
