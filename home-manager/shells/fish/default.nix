{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      starship init fish | source
      abbr -a music "cmus"
      abbr -a ff "fastfetch"
    '';
  };
}
