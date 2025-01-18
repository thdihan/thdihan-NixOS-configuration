{pkgs, config, ...}:
let
  global = import /etc/nixos/constants/global.nix {pkgs = pkgs; config = config; builtins = builtins;};
  home-manager = global.home-manager;
  cursor = global.cursor;
  font_name = global.font_name;
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.sharedModules = [
    {
        gtk = {
          enable = true;

          theme = {
            name = "Dracula";
            package = pkgs.dracula-theme;
          };

          iconTheme = {
            name = "Dracula";
            package = pkgs.dracula-icon-theme;
          };

          cursorTheme = {
            name = cursor.theme.name;
            package = cursor.theme.package;
            size = cursor.size;
          };

          font = {
            name = font_name.sans_serif;
            package = pkgs.nerd-fonts.noto;
            size = 11;
          };

        };
    }
  ];
}