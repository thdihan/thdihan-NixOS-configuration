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
          git = {
            enable = true;
          };
      };
    }
  ];
}