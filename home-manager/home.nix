{
  pkgs,
  config,
  host,
  username,
  lib,
  ...
}: let
  inherit (lib) mkOption types;
in {
  options.hmModules.core.bash = mkOption {
    enabled = mkOption {
      type = types.bool;
      default = true;
    };
  };
  config = {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      profileExtra = ''

      '';
      shellAliases = {
     ff = "fastfetch";     
      };
    };
  };
}

[alex@glove:~]$ vim .config/home-manager/bash/default.
nix

[alex@glove:~]$ home-manager switch
these 4 derivations will be built:
  /nix/store/5bbbmakmav9qzp4wqs48nxn1jvywp05l-profile.drv
  /nix/store/m8hd5hbgqa2agxyf0ckkwmmg93r5kfpm-bashrc.drv
  /nix/store/ybmbbg2zydzrqvz9fhmxgpsn7cjmkgc6-home-manager-files.drv
  /nix/store/77p716wi5aavvzvfg8wv1bpw91jmakyg-home-manager-generation.drv
building '/nix/store/m8hd5hbgqa2agxyf0ckkwmmg93r5kfpm-bashrc.drv'...
building '/nix/store/5bbbmakmav9qzp4wqs48nxn1jvywp05l-profile.drv'...
building '/nix/store/ybmbbg2zydzrqvz9fhmxgpsn7cjmkgc6-home-manager-files.drv'...
building '/nix/store/77p716wi5aavvzvfg8wv1bpw91jmakyg-home-manager-generation.drv'...
/nix/store/bvmk7cfv7vj2410wrpsz24kbdfxq9b03-home-manager-generation
Starting Home Manager activation
Activating checkFilesChanged
Activating checkLinkTargets
Activating writeBoundary
Activating installPackages
replacing old 'home-manager-path'
installing 'home-manager-path'
Activating linkGeneration
Cleaning up orphan links from /home/alex
Creating profile generation 20
Creating home file links in /home/alex
Activating onFilesChange
Activating reloadSystemd

There are 160 unread and relevant news items.
Read them by running the command "home-manager news".


[alex@glove:~]$ cat .config/home-manager/bash/default.
nix
{ pkgs, config, host, username, lib, ... }: let
  inherit (lib) mkOption types;
in {
  options.hmModules.core.bash = mkOption {
    enabled = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      profileExtra = ''
        # guh
      '';
      shellAliases = {
        ff = "fastfetch";     
      };
      bashrcExtra = '' 
        eval "$(starship init bash)"
      '';
    };
  };
}


[alex@glove:~]$ cat .config/home-manager/home.nix
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
