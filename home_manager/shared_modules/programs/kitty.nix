{pkgs, config, ...}:
let
  global = import /etc/nixos/constants/global.nix {pkgs = pkgs; config = config; builtins = builtins;};
  home-manager = global.home-manager;
  dracula_theme = global.dracula_theme;
  font_name = global.font_name;

in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.sharedModules = [
    {
      programs = {
          kitty = {
            enable = true;

            shellIntegration = {
              mode = "no-rc";
              enableBashIntegration = true;
            };

            font = {
              name = font_name.mono;
              package = pkgs.nerd-fonts.noto;
              size = 11;
            };

            keybindings = { };

            settings = {
              sync_to_monitor = "yes";

              window_padding_width = "0 4 0 4";
              confirm_os_window_close = 0;

              enable_audio_bell = "yes";
              detect_urls = "yes";
              scrollback_lines = -1;
              click_interval = -1;

              # Colors
              foreground = dracula_theme.hex.foreground;
              background = dracula_theme.hex.background;
              selection_foreground = "#ffffff";
              selection_background = dracula_theme.hex.current_line;
              url_color = dracula_theme.hex.cyan;
              title_fg = dracula_theme.hex.foreground;
              title_bg = dracula_theme.hex.background;
              margin_bg = dracula_theme.hex.comment;
              margin_fg = dracula_theme.hex.current_line;
              removed_bg = dracula_theme.hex.red;
              highlight_removed_bg = dracula_theme.hex.red;
              removed_margin_bg = dracula_theme.hex.red;
              added_bg = dracula_theme.hex.green;
              highlight_added_bg = dracula_theme.hex.green;
              added_margin_bg = dracula_theme.hex.green;
              filler_bg = dracula_theme.hex.current_line;
              hunk_margin_bg = dracula_theme.hex.current_line;
              hunk_bg = dracula_theme.hex.purple;
              search_bg = dracula_theme.hex.cyan;
              search_fg = dracula_theme.hex.background;
              select_bg = dracula_theme.hex.yellow;
              select_fg = dracula_theme.hex.background;

              # Splits/Windows
              active_border_color = dracula_theme.hex.foreground;
              inactive_border_color = dracula_theme.hex.comment;

              # Tab Bar Colors
              active_tab_foreground = dracula_theme.hex.background;
              active_tab_background = dracula_theme.hex.foreground;
              inactive_tab_foreground = dracula_theme.hex.background;
              inactive_tab_background = dracula_theme.hex.comment;

              # Marks
              mark1_foreground = dracula_theme.hex.background;
              mark1_background = dracula_theme.hex.red;

              # Cursor Colors
              cursor = dracula_theme.hex.foreground;
              cursor_text_color = dracula_theme.hex.background;

              # Black
              color0 = "#21222c";
              color8 = dracula_theme.hex.comment;

              # Red
              color1 = dracula_theme.hex.red;
              color9 = "#ff6e6e";

              # Green
              color2 = dracula_theme.hex.green;
              color10 = "#69ff94";

              # Yellow
              color3 = dracula_theme.hex.yellow;
              color11 = "#ffffa5";

              # Blue
              color4 = dracula_theme.hex.purple;
              color12 = "#d6acff";

              # Magenta
              color5 = dracula_theme.hex.pink;
              color13 = "#ff92df";

              # Cyan
              color6 = dracula_theme.hex.cyan;
              color14 = "#a4ffff";

              # White
              color7 = dracula_theme.hex.foreground;
              color15 = "#ffffff";
            };

            extraConfig = '' '';
          };
      };
    }
  ];
}