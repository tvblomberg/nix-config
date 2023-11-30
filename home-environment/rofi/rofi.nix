{ pkgs, config, ... }:
let
  backgroundColor = config.colorScheme.colors.base00;
  foregroundColor = config.colorScheme.colors.base05;
  textColor = config.colorScheme.colors.base04;
  lightBackgroundColor = config.colorScheme.colors.base01;
  lightForegroundColor = config.colorScheme.colors.base06;
  urgentColor = config.colorScheme.colors.base08;
  selectionBackground = config.colorScheme.colors.base02;
in
{

  # Rofi Configuration
  programs.rofi = {
    enable = true;
    theme = "${pkgs.writeText "theme.rasi"
''
* {
    red:                         #${urgentColor};
    blue:                        #${backgroundColor};
    lightfg:                     #${foregroundColor};
    lightbg:                     #${backgroundColor};
    foreground:                  #${foregroundColor};
    background:                  #${backgroundColor};
    background-color:            #${backgroundColor};
    separatorcolor:              @foreground;
    border-color:                @foreground;
    selected-normal-foreground:  @lightbg;
    selected-normal-background:  @lightfg;
    selected-active-foreground:  @background;
    selected-active-background:  @blue;
    selected-urgent-foreground:  @background;
    selected-urgent-background:  @red;
    normal-foreground:           @foreground;
    normal-background:           @background;
    active-foreground:           @blue;
    active-background:           @background;
    urgent-foreground:           @red;
    urgent-background:           @background;
    alternate-normal-foreground: @foreground;
    alternate-normal-background: @lightbg;
    alternate-active-foreground: @blue;
    alternate-active-background: @lightbg;
    alternate-urgent-foreground: @red;
    alternate-urgent-background: @lightbg;
    spacing:                     2;
}
window {
    background-color: @background;
    border:           1;
    padding:          5;
}
mainbox {
    border:           0;
    padding:          0;
}
message {
    border:           1px dash 0px 0px ;
    border-color:     @separatorcolor;
    padding:          1px ;
}
textbox {
    text-color:       @foreground;
}
listview {
    fixed-height:     0;
    border:           2px solid 0px 0px ;
    border-color:     @separatorcolor;
    spacing:          2px ;
    scrollbar:        true;
    padding:          2px 0px 0px ;
}
element-text, element-icon {
    background-color: inherit;
    text-color:       inherit;
}
element {
    border:           0;
    padding:          1px ;
}
element normal.normal {
    background-color: @normal-background;
    text-color:       @normal-foreground;
}
element normal.urgent {
    background-color: @urgent-background;
    text-color:       @urgent-foreground;
}
element normal.active {
    background-color: @active-background;
    text-color:       @active-foreground;
}
element selected.normal {
    background-color: @selected-normal-background;
    text-color:       @selected-normal-foreground;
}
element selected.urgent {
    background-color: @selected-urgent-background;
    text-color:       @selected-urgent-foreground;
}
element selected.active {
    background-color: @selected-active-background;
    text-color:       @selected-active-foreground;
}
element alternate.normal {
    background-color: @alternate-normal-background;
    text-color:       @alternate-normal-foreground;
}
element alternate.urgent {
    background-color: @alternate-urgent-background;
    text-color:       @alternate-urgent-foreground;
}
element alternate.active {
    background-color: @alternate-active-background;
    text-color:       @alternate-active-foreground;
}
scrollbar {
    width:            4px ;
    border:           0;
    handle-color:     @normal-foreground;
    handle-width:     8px ;
    padding:          0;
}
sidebar {
    border:           2px dash 0px 0px ;
    border-color:     @separatorcolor;
}
button {
    spacing:          0;
    text-color:       @normal-foreground;
}
button selected {
    background-color: @selected-normal-background;
    text-color:       @selected-normal-foreground;
}
inputbar {
    spacing:          0px;
    text-color:       @normal-foreground;
    padding:          1px ;
    children:         [ prompt,textbox-prompt-colon,entry,case-indicator ];
}
case-indicator {
    spacing:          0;
    text-color:       @normal-foreground;
}
entry {
    spacing:          0;
    text-color:       @normal-foreground;
}
prompt {
    spacing:          0;
    text-color:       @normal-foreground;
}
textbox-prompt-colon {
    expand:           false;
    str:              ":";
    margin:           0px 0.3000em 0.0000em 0.0000em ;
    text-color:       inherit;
}
    ''}";
  };
}
