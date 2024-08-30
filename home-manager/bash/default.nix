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
