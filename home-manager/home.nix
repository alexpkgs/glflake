{ config, pkgs, ... }:

{
  # Specify the username and home directory for Home Manager
  home.username = "alex";
  home.homeDirectory = "/home/alex";

  # Import other configuration files
  imports = [
    ./mako/default.nix
    ./foot/default.nix
    ./rofi/default.nix
    ./qutebrowser/default.nix
    ./bash/default.nix
    ./dunst/default.nix
    ./starship/default.nix
  ];

  # Set the Home Manager state version
  home.stateVersion = "24.05";

  # Specify packages to install in your environment
  home.packages = [
    pkgs.fastfetch
    pkgs.starship
    pkgs.bash
    pkgs.lsd
    pkgs.mako
    pkgs.foot
    pkgs.rofi
    pkgs.qutebrowser
    pkgs.dunst
    pkgs.swaylock
  ];

  # Define files to be managed by Home Manager
  home.file = {
    # Example: Uncomment and specify files if needed
    # ".screenrc".source = ./dotfiles/screenrc;  # Adjust path as necessary
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Define environment variables for the Home Manager shell
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

   # Enable Home Manager
  programs.home-manager.enable = true;
}
