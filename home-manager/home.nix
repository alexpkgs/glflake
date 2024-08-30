{ config, pkgs, ... }:

{
  # Specify the username and home directory for Home Manager
  home.username = "alex";
  home.homeDirectory = "/home/alex";

  # Import other configuration files
  imports = [
    ./mako/default.nix
    ./foot/default.nix
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

  # Enable and configure Bash
  programs.bash.enable = true;
  programs.bash.shellAliases = {
    ll = "ls -l";
    ff = "fastfetch";
    fsh = "info='n os wm sh n' fet.sh";
    doas = "sudo";
    files = "lf";
  };

  # Ensure Starship prompt initialization in Bash
  programs.bash.bashrcExtra = ''
    # Initialize Starship prompt
    eval "$(starship init bash)"
  '';

  # Enable Home Manager
  programs.home-manager.enable = true;
}
