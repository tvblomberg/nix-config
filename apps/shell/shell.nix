{ pkgs, config, ... }:

{
  # ChatGPT Token Secret
  age.secrets.chatgpt = {
    file = ../../secrets/chatgpt.age;
  };

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
    initExtra = ''
      export OPENAI_API_KEY=$(cat ${config.age.secrets.chatgpt.path})
    '';
  };
  
  # Fish Configuration
  programs.fish = {
      enable = true;
      shellAliases = {
        nvim = "steam-run nvim";
        vim = "steam-run nvim";
        vi = "steam-run nvim";
        pow = "powerprofilesctl";
        powershell = "pwsh";
      };
      shellInit = ''
        export OPENAI_API_KEY=$(cat ${config.age.secrets.chatgpt.path})
      '';
  };

}
