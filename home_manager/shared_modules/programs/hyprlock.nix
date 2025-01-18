{pkgs, config, ...}:
let
  global = import /etc/nixos/constants/global.nix {pkgs = pkgs; config = config; builtins = builtins;};
  home-manager = global.home-manager;
  dracula_theme = global.dracula_theme;
  font_name = global.font_name;
  wallpaper = global.wallpaper;

in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.sharedModules = [
    {
      programs = {
          hyprlock = {
            enable = true;

            sourceFirst = true;

            settings = {
              general = {
                disable_loading_bar = true;
                immediate_render = true;
                fractional_scaling = 2; # 2 = Auto

                no_fade_in = false;
                no_fade_out = false;

                hide_cursor = false;
                text_trim = false;

                grace = 0;
                ignore_empty_input = true;
              };

              auth = {
                pam = {
                  enabled = true;
                };
              };

              background = [
                {
                  monitor = "";
                  path = wallpaper;
                }
              ];

              label = [
                {
                  monitor = "";
                  halign = "center";
                  valign = "top";
                  position = "0, -128";

                  text_align = "center";
                  font_family = font_name.sans_serif;
                  color = dracula_theme.rgba.foreground;
                  font_size = 64;
                  text = "$TIME12";
                }

                {
                  monitor = "";
                  halign = "center";
                  valign = "center";
                  position = "0, 0";

                  text_align = "center";
                  font_family = font_name.sans_serif;
                  color = dracula_theme.rgba.foreground;
                  font_size = 16;
                  text = "$DESC"; # Full Name
                }
              ];

              input-field = [
                {
                  monitor = "";
                  halign = "center";
                  valign = "bottom";
                  position = "0, 128";

                  size = "256, 48";
                  rounding = 16;
                  outline_thickness = 1;
                  # outer_color = "";
                  shadow_passes = 0;
                  hide_input = false;
                  inner_color = dracula_theme.rgba.current_line;
                  font_family = font_name.sans_serif;
                  font_color = dracula_theme.rgba.foreground;
                  placeholder_text = "Password";
                  dots_center = true;
                  dots_rounding = -1;

                  fade_on_empty = true;

                  invert_numlock = false;
                  # capslock_color = "";
                  # numlock_color = "";
                  # bothlock_color = "";

                  # check_color = "";
                  # fail_color = "";
                  fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
                  fail_timeout = 2000;
                }
              ];
            };

            extraConfig = '' '';
          };
      };
    }
  ];
}