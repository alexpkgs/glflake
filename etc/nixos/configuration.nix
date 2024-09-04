{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./intel-drivers.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "lenovo"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Services
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "";

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  programs.river.enable = true;

  # Time zone and internationalization
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

  # Users
  users.users.alex = {
    isNormalUser = true;
    description = "alex";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  
  services.getty.autologinUser = "alex";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Environment packages
  environment.systemPackages = with pkgs; [
    vim
    sddm
    firefox
    wayland
    wlroots
    swww
    git
    emacs
    dunst
    cmus
    grim
    slurp
    wl-clipboard
    wlr-randr
    cava
    xwayland
    fira-code
  ];

  # Flakes and nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # PipeWire
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };

  # Security
  security.rtkit.enable = true;

# cache stuff ig 
nix.optimise.automatic = true;
nix.settings.auto-optimise-store = true;

nix.gc = {
  automatic = true;
  options = "--delete-older-than 7d";
};
 
   # State version
  system.stateVersion = "24.05"; # Did you read the comment? 
}
