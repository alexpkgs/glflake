{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      character = {
        success_symbol = "[](fg:#fffff)";
        error_symbol = "[ ](fg:#fffff)";
        vimcmd_symbol = "[<](fg:#fffff)";
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
