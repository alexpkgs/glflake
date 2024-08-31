{ config, pkgs, ... }:

{
  # Specify the username and home directory for Home Manager
  home.username = "alex";
  home.homeDirectory = "/home/alex";

  # Import other configuration files
  imports = [
    ./nofi/mako/default.nix
    ./terminals/foot/default.nix
    ./launchers/rofi/default.nix
    ./browser/qutebrowser/default.nix
    ./shells/bash/default.nix
    ./shells/starship/default.nix
    ./bar/waybar/default.nix
    ./fetchs/fastfetch/default.nix
    ./nofi/dunst/default.nix
    ./shells/zsh/default.nix
  ];

 
  # Set the Home Manager state version
  home.stateVersion = "24.05";

  # Specify packages to install in your environment
  home.packages = [
    pkgs.fastfetch
    pkgs.starship
    pkgs.swaylock
    pkgs.bash
    pkgs.lsd
    pkgs.neovim
    pkgs.mako
    pkgs.fff
    pkgs.waybar
    pkgs.dunst
    pkgs.foot
    pkgs.lf
    pkgs.rofi
    pkgs.qutebrowser
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
