{pkgs, config, ...}:
let

in
{
  imports = [
    ./rofi.nix
    ./waybar.nix
    ./hyprlock.nix
    ./kitty.nix
    ./git.nix
  ];
}