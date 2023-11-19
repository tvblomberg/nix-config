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
    source = ./swaylock;
    text = ''
{
    "label" : "lock",
    "action" : "waylock",
    "text" : "Lock",
    "keybind" : "l"
}
{
    "label" : "logout",
    "action" : "loginctl terminate-user $USER",
    "text" : "Logout",
    "keybind" : "e"
}
{
    "label" : "shutdown",
    "action" : "systemctl poweroff",
    "text" : "Shutdown",
    "keybind" : "s"
}
{
    "label" : "suspend",
    "action" : "systemctl suspend",
    "text" : "Suspend",
    "keybind" : "u"
}
{
    "label" : "reboot",
    "action" : "systemctl reboot",
    "text" : "Reboot",
    "keybind" : "r"
}
    '';
  };

}
