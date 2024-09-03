{
  services.mako = {
    enable = true;
    icons = true;
    sort = "-time";
    layer = "overlay";
    anchor = "top-left";
    width = 400;
    height = 400;
    padding = "10";
    margin = "10,10,10";
    output = "HDMI-A-1";
    backgroundColor = "#101010";
    textColor = "#ffffff";
    borderSize = 0;
    borderRadius = 0;
    defaultTimeout = 5000;
    font = "uzura_font 12px";

    extraConfig = ''
      format=<b>%s</b>\n\n%b
    '';
  };
}
