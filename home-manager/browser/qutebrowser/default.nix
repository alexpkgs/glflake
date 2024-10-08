let
  palette = {
    background = "#1c1c1c";  # yum
    background-alt = "#111111";  # Slightly lighter black
    background-attention = "#222222";  # Dark grey
    border = "#555555";  # Grey
    current-line = "#333333";  # Dark grey
    selection = "#333333";  # Dark grey
    foreground = "#FFFFFF";  # White
    foreground-alt = "#CCCCCC";  # Light grey
    foreground-attention = "#FFFFFF";  # White
    comment = "#555555";  # Grey
    cyan = "#CCCCCC";  # Light grey
    green = "#AAAAAA";  # Grey
    pink = "#AAAAAA";  # Grey
    purple = "#AAAAAA";  # Grey
    red = "#FF0000";  # Red
    yellow = "#AAAAAA";  # Grey
  };
in {
  xdg.configFile."qutebrowser/greasemonkey".source = ./greasemonkey;
  programs.qutebrowser = {
    enable = true;
    keyBindings = {
      normal = {
        "t" = "cmd-set-text -s :open -t";
        "yf" = "hint links yank";
        "yd" = "hint links download";
        ";p" = "spawn --userscript qute-bitwarden --auto-lock 0";
        ";t" = "spawn --userscript qute-bitwarden --auto-lock 0 -T";
      };
      insert = {
      };
    };
    searchEngines = {
      "DEFAULT" = "https://www.google.com/search?q={}";
      "y" = "https://youtube.com/results?search_query={}";
      "gt" = "https://github.com/search?q={}&type=repositories";
    };
    settings = {
      url = {
        default_page = "https://start.duckduckgo.com";
        start_pages = ["https://start.duckduck.com"];
      };

      fonts = {
        default_family = ["Fira Code" "Fira Code"];
        default_size = "13px";
        web.family = {
          sans_serif = "Fira Code";
          serif = "Fira Code";
          fixed = "Fira Code";
          standard = "Fira Code";
        };
      };
      content.blocking.method = "both";
      content.blocking.adblock.lists = [
        "https://raw.githubusercontent.com/tofukko/filter/master/Adblock_Plus_list.txt"
      ];
      zoom.default = "90%";
      scrolling.smooth = false;
      scrolling.bar = "never";
      auto_save.session = true;
      qt.highdpi = true;
      colors = {
        webpage.preferred_color_scheme = "dark";
        completion = {
          category = {
            bg = palette.background;
            fg = palette.foreground;
            border = {
              bottom = palette.border;
              top = palette.border;
            };
          };
          even = {
            bg = palette.background;
          };
          odd = {
            bg = palette.background-alt;
          };
          item = {
            selected = {
              bg = palette.background;
              border = {
                bottom = palette.green;
                top = palette.green;
              };
              fg = palette.green;
              match = {
                fg = palette.purple;
              };
            };
          };
          match = {
            fg = palette.green;
          };
          scrollbar = {
            bg = palette.background;
            fg = palette.foreground;
          };
        };
        downloads = {
          bar = {
            bg = palette.background;
          };
          error = {
            bg = palette.background;
            fg = palette.red;
          };
          stop = {
            bg = palette.background;
          };
          system = {
            bg = "none";
          };
        };
        hints = {
          bg = palette.background;
          fg = palette.green;
          match = {
            fg = palette.foreground-alt;
          };
        };
        keyhint = {
          bg = palette.background;
          fg = palette.purple;
          suffix = {
            fg = palette.selection;
          };
        };
        messages = {
          error = {
            bg = palette.background;
            border = palette.background-alt;
            fg = palette.red;
          };
          info = {
            bg = palette.background;
            border = palette.background-alt;
            fg = palette.comment;
          };
          warning = {
            bg = palette.background;
            border = palette.background-alt;
            fg = palette.red;
          };
        };
        statusbar = {
          caret = {
            bg = palette.background;
            fg = palette.green;
            selection = {
              bg = palette.background;
              fg = palette.green;
            };
          };
          command = {
            bg = palette.background;
            fg = palette.green;
            private = {
              bg = palette.background;
              fg = palette.foreground-alt;
            };
          };
          insert = {
            bg = palette.background-attention;
            fg = palette.foreground-attention;
          };
          normal = {
            bg = palette.background;
            fg = palette.foreground;
          };
          passthrough = {
            bg = palette.background;
            fg = palette.green;
          };
          private = {
            bg = palette.background-alt;
            fg = palette.foreground-alt;
          };
          progress = {
            bg = palette.background;
          };
          url = {
            error = {
              fg = palette.red;
            };
            fg = palette.foreground;
            hover = {
              fg = palette.cyan;
            };
            success = {
              http = {
                fg = palette.green;
              };
              https = {
                fg = palette.green;
              };
            };
            warn = {
              fg = palette.yellow;
            };
          };
        };
        tabs = {
          bar = {
            bg = palette.background;
          };
          even = {
            bg = palette.background;
            fg = palette.foreground;
          };
          indicator = {
            error = palette.red;
            start = palette.pink;
            stop = palette.green;
            system = "none";
          };
          odd = {
            bg = palette.background;
            fg = palette.foreground;
          };
          selected = {
            even = {
              bg = palette.background;
              fg = palette.green;
            };
            odd = {
              bg = palette.background;
              fg = palette.green;
            };
          };
          pinned = {
            even = {
              bg = palette.background;
              fg = palette.foreground;
            };
            odd = {
              bg = palette.background;
              fg = palette.foreground;
            };
            selected = {
              even = {
                bg = palette.background;
                fg = palette.green;
              };
              odd = {
                bg = palette.background;
                fg = palette.green;
              };
            };
          };
        };
        contextmenu = {
          disabled.fg = palette.foreground;
          menu = {
            bg = palette.background;
            fg = palette.foreground;
          };
          selected.fg = palette.green;
        };
      };
      hints = {
        border = "1px solid ${palette.background-alt}";
      };
      tabs = {
        favicons = {
          scale = 1;
        };
        indicator = {
          width = 3;
        };
        position = "left";
        width = 220;
        show = "always";
        show_switching_delay = 800;
        new_position.related = "last";
      };
      statusbar.show = "never";
      completion = {
        height = "10%";
      };
    };
    extraConfig = ''
      c.statusbar.padding = { "bottom":2, "right":5, "left":5, "top":2 }
      c.tabs.padding = { "bottom":2, "right":5, "left":5, "top":2 }
      c.tabs.title.format = "{current_title}"
      c.tabs.title.format_pinned = "{current_title}"
      c.statusbar.widgets = ["keypress", "search_match","url","scroll","history","progress","clock"]
      config.unbind("O")
      config.load_autoconfig(False)
    '';
  };
}
