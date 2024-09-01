# This configuration file defines what should be installed on your system.
# Refer to the configuration.nix(5) man page and the NixOS manual ('nixos-help') for more information.

{ config, pkgs, ... }:

{
  imports =
    [ # Include the hardware scan results.
      ./hardware-configuration.nix
    ];

  # Bootloader configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking configuration
  networking.hostName = "glove";
  networking.networkmanager.enable = true;

  # Time zone and locale settings
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # X11 configuration
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # User account configuration
  users.users.alex = {
    isNormalUser = true;
    description = "alex";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  services.getty.autologinUser = "alex";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [
    vim
    sddm
    river
    firefox
    waybar
    wayland
    wlroots
    dunst
    swww
    git
    emacs
    flatpak
    cmus
    grim
    slurp
    wl-clipboard
    wlr-randr
    cava
  ];

  # Display manager configuration
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # Flakes and nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Flatpak configuration
  services.flatpak.enable = true;

  # PipeWire configuration
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };
  security.rtkit.enable = true;


  # System state version
  system.stateVersion = "24.05"; # Set this to the NixOS release version you installed
}
