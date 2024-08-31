{ pkgs, configs, ... }:
{
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;
    settings = {
      logo = {
        type = "auto";
        source = "/home/alex/.config/home-manager/fetchs/fastfetch/nixos";
        width = 44;
        height = 15;
      };
      display = {
        separator = "";
      };
      modules = [
        {
          type = "title";
          format = "{1}@{2}";
        }
        { type = "break"; }
        {
          type = "wm";
          key = " ";
        }
        {
          type = "terminal";
          key = " ";
        }
        {
          type = "theme";
        }
        {
          type = "colors";
          symbol = "square";
          paddingLeft = 0;
        }
      ];
    };
  };
}
