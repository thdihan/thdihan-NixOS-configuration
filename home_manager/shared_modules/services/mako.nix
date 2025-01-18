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
      services = {
          mako = {
            enable = true;

            actions = true;

            anchor = "top-right";
            layer = "top";
            margin = "10";
            sort = "-time";
            maxVisible = 5; # -1 = Disabled
            ignoreTimeout = false;
            defaultTimeout = 0; # Disabled

            borderRadius = 8;
            borderSize = 1;
            borderColor = dracula_theme.hex.comment;
            backgroundColor = dracula_theme.hex.background;
            padding = "4";
            icons = true;
            maxIconSize = 16;
            markup = true;
            font = "${font_name.sans_serif} 11";
            textColor = dracula_theme.hex.foreground;
            format = "<b>%s</b>\\n%b";

            extraConfig = ''
              history=1

              on-notify=none
              on-button-left=dismiss
              on-button-right=exec makoctl menu rofi -dmenu -p 'Choose Action'
              on-button-middle=none
              on-touch=exec  makoctl menu rofi -dmenu -p 'Choose Action'

              [urgency=low]
              border-color=${dracula_theme.hex.current_line}

              [urgency=normal]
              border-color=${dracula_theme.hex.comment}

              [urgency=high]
              border-color=${dracula_theme.hex.red}
            '';
          };
      };
    }
  ];
}