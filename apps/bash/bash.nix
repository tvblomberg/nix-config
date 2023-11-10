{ pkgs, config, ... }:

{

  # Bash Configuration
  programs.bash = {
    enable = true;
    shellAliases = {
      vim = "nvim";
    };
  };

}
