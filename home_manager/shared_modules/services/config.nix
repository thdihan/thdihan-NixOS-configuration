{pkgs, config, ...}:
let

in
{
  imports = [
    ./mako.nix
    ./hyprpaper.nix
  ];
}