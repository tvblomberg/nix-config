{ pkgs, config, ...}:
let
  backgroundColor = config.colorScheme.colors.base00;
  borderColor = config.colorScheme.colors.base05;
  textColor = config.colorScheme.colors.base04;
in
{

  # Waybar Configuration
programs.waybar = {
  enable = true;
};

home.file.".config/waybar/style.css".text = 
''

* {
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
    font-size: 13px;
}

window#waybar {
    background-color: #${backgroundColor};
    border-bottom: 3px solid #${borderColor};
    color: #${textColor};
    transition-property: background-color;
    transition-duration: .5s;
}


button {
    /* Use box-shadow instead of border so the text isn't offset */
    box-shadow: inset 0 -3px transparent;
    /* Avoid rounded borders under each button name */
    border: none;
    border-radius: 0;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
/*button:hover {
    background: inherit;
    box-shadow: inset 0 -3px #ffffff;
}*/

#workspaces button {
    padding: 0 5px;
    background-color: transparent;
    color: #${textColor};
}

#workspaces button:hover {
    background-color: #${borderColor};
    border-bottom: 3px solid #${backgroundColor};
    color: #${backgroundColor}
}

#workspaces button.focused {
    background-color: #${borderColor};
    border-bottom: 3px solid #${backgroundColor};
    color: #${backgroundColor}
}

/*#mode {
    background-color: #64727D;
    border-bottom: 3px solid #ffffff;
}*/

#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#backlight,
#network,
#pulseaudio,
#wireplumber,
#custom-media,
#tray,
#mode,
#idle_inhibitor,
#scratchpad,
#pulseaudio,
#idle_inhibitor,
#mpd {
    padding: 0 4px; 
    color: #${textColor};
    background-color: #${backgroundColor};
    margin: 0 4px;
    border-bottom: 3px solid #${borderColor};
}

#custom-apps,
#custom-poweroff {
  color: #${backgroundColor};
  background-color: #${borderColor};
}

#window,
#workspaces {
    margin: 0 4px;
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
    margin-right: 0;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}

#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: #ffffff;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

label:focus {
    background-color: #000000;
}

#temperature.critical {
    background-color: #eb4d4b;
}

#tray > .passive {
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
}

'';

home.file.".config/waybar/config".source = ./config;
}
