# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }: let
  flake-compat = builtins.fetchTarball { 
    url  = "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
    sha256 = "0m9grvfsbwmvgwaxvdzv6cmyvjnlww004gfxjvcl806ndqaxzy4j";
  };

  hyprland-flake = (import flake-compat {
    src = builtins.fetchTarball {
      url = "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
      sha256 = "0ja74qqrq493d7v1bjj2m1r0cqa8bym4akh1xqvs3aj1sq4ybf8y";
    };
  }).defaultNix;
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration-hal.nix
    ];
  # Power Management
  powerManagement.enable = true;

  # Power behavior
  services.logind = {
    lidSwitch = "suspend";
    powerKeyLongPress = "poweroff";
    powerKey = "lock";
  };
    
  # Needed for steam
  hardware.opengl.driSupport32Bit = true;  
  
  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # GTK Portal
  xdg.portal = { enable = true; extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; };

  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    package = hyprland-flake.packages.${pkgs.system}.hyprland;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hal"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # GDM
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.invincent = {
    isNormalUser = true;
    initialPassword = "letmeindamnit";
    extraGroups = [ "wheel" "input" "uinput" "libvirtd"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };

  hardware.uinput.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
    powerOnBoot = false;
  };

  services.blueman.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];  
  
  system.activationScripts.binbash = {
    deps = [ "binsh" ];
    text = ''
         ln -s /bin/sh /bin/bash
    '';
  };

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  services.fprintd = {
    enable = true;
  };
}

