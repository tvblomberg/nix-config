{ pkgs, config, ... }:

{

  # Bash Configuration
  programs.bash = {
    enable = true;
    shellAliases = {
      nvim = "steam-run nvim";
      vim = "steam-run nvim";
      vi = "steam-run nvim";
      pow = "powerprofilesctl";
      powershell = "pwsh";
    };
  };

}
