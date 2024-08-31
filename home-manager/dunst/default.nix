{ pkgs, ... }: let
  inherit (pkgs) libnotify papirus-icon-theme;
in {
  home.packages = [ libnotify ];

  services.dunst = {
    enable = true;

    settings = {
      global = {
        frame_color = "#101010";
        geometry = "300x5+10+45"; 
        width = 300;
        separator_height = 5;
        padding = 10;
        horizontal_padding = 24;
        frame_width = 3;
        idle_threshold = 120;
        alignment = "left";
        word_wrap = "yes";
        transparency = 5;
        format = "<b>%s</b>: %b";
        markup = "full";
        min_icon_size = 32;
        max_icon_size = 128;
        shrink = 0;
      };

      urgency_low = {
        background = "#101010";
        foreground = "#ffffff";
      };

      urgency_normal = {
        background = "#101010";
        foreground = "#ffffff";
      };

      urgency_critical = {
        background = "#101010";
        foreground = "#ffffff";
        frame_color = "#101010";
      };
    };
  };
}
