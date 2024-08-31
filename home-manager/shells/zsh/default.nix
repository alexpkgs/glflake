{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      vi = "vim";
      ff = "fastfetch";
    };

    history.size = 10000;
    history.path = "${config.xdg.stateHome}/zsh/history"; 

    # starship/zoxide 
    initExtra = ''
        eval "$(starship init zsh)"
    '';
  };
}
