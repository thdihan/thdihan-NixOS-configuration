{pkgs, config, ...}:
let
  global = import /etc/nixos/constants/global.nix {pkgs = pkgs; config = config; builtins = builtins;};
  home-manager = global.home-manager;
  cursor = global.cursor;
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.sharedModules = [
    {
      home = {
          pointerCursor = {
            name = cursor.theme.name;
            package = cursor.theme.package;
            size = cursor.size;

            hyprcursor = {
              enable = true;
              size = cursor.size;
            };

            gtk.enable = true;
          };

          stateVersion = "24.11";
        };
    }
  ];
}