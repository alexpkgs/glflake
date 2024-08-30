{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    theme = ./theme.rasi;

    extraConfig = {
      drun-display-format = "{name}";
    };
  };
}
