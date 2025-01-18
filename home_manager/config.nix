{pkgs, config, ...}:
let

in
{
  imports = [
    ./shared_modules/config.nix
  ];
}