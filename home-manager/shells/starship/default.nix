{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      character = {
        success_symbol = "[](fg:#fffff)";
        error_symbol = "[ ](fg:#d59076)";
        vimcmd_symbol = "[<](fg:#d59076)";
      };
      git_status = {
        ahead = "";
        behind = "<";
        diverged = "<>";
        renamed = "";
        deleted = "";
      };
      git_commit = {
        tag_symbol = " tag ";
      };
      time = {
        disabled = false;
        style = "green";
        format = "($style)";
      };
    };
  };
}
