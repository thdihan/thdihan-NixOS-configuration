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
      xdg = {
        mime.enable = true;

        mimeApps = {
          enable = true;

          associations = {
            added = config.xdg.mime.addedAssociations;

            removed = config.xdg.mime.removedAssociations;
          };

          defaultApplications = config.xdg.mime.defaultApplications;
        };

        configFile = {
          "mimeapps.list".force = true;
        };
      };
    }
  ];
}