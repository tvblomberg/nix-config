{ pkgs, config, ... }:

{

  # Git Configuration
  programs.git = {
    enable = true;
    userEmail = "thomas.v.blomberg@gmail.com";
    userName = "Thomas V. Blomberg";
  };

}
