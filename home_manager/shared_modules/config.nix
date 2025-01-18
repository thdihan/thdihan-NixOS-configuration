{pkgs, config, ...}:
let

in
{
  imports = [
    ./hyprland.nix
    ./home.nix
    ./xdg.nix
    ./programs/config.nix
    ./services/config.nix
  ];
}