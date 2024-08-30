{
  config,
  pkgs,
  ...
}: {
  programs.waybar.enable = true;

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "bottom";
      height = 34;
      output = [
        "eDP-1"
      ];

      modules-left = ["custom/logo" "clock" "battery"];
      modules-right = [];
      modules-center = [];

      "bluetooth" = {
        format = "   {status}";
        format-disabled = "";
        format-connected = "   {num_connections}";
      };

      "custom/logo" = {
        format = "󱄅";
        tooltip = false;
      };

      "river/tags" = {
        format = "{icon}";
        tooltip = false;
        all-outputs = true;
        format-icons = {
          active = "";
          default = "";
        };
      };

      "memory" = {
        interval = "2";
        format = "RAM: {usage}GiB |";
      };

      "cpu" = {
        interval = "1";
        format = "󰋑 {max_frequency}GHz";
        max-length = 13;
        min-length = 13;
        tooltip = false;
      };

      "network" = {
        format = "  ";
        format-ethernet = "  ";
        tooltip = false;
      };

      "battery" = {
        format = " {capacity}%";
        format-charging = "󰂄{capacity}%";
        format-icons = [
          "󱈐"
          "󰋑"
          "󰋑"
          "󰋑"
          "󱈏"
        ];
        states = {
          critical = 20;
        };
        tooltip = false;
      };
    };
  };

  programs.waybar.style = ''

    * {
      border: none;
      border-radius: 0;
      padding: 0;
      margin: 0;
      font-size: 12px;
      color: #ffffff
    }

    window#waybar {
      background: #101010;
      color: #ffffff;
    }

    #custom-logo {
      font-size: 18px;
      margin: 0;
      margin-left: 7px;
      margin-right: 12px;
      padding: 0;
      font-family: Fira Code;
      color: #ffffff;
    }

    #workspaces button {
      color: #b4befe;
    }

    #battery {
      margin-left: 7px;
      margin-right: 5px;
      color: #ffffff;
    }
  '';
}