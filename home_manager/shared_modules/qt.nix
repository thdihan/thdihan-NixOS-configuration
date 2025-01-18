{pkgs, config, ...}:
let
  global = import /etc/nixos/constants/global.nix {pkgs = pkgs; config = config; builtins = builtins;};
  home-manager = global.home-manager;
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.sharedModules = [
    {
        qt = {
          enable = true;

          platformTheme.name = "gtk";

          style = {
            name = "Dracula";
            package = pkgs.dracula-qt5-theme;
          };
        };
    }
  ];
}