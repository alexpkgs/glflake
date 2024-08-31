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
        reboot = "systemctl reboot";
        shutdown = "shutdown -h now";
        music = "cmus";
        files = "fff";     
      };
      bashrcExtra = '' 
        eval "$(starship init bash)"
      '';
    };
  };
}
