{pkgs, config, builtins,...} : 
let

  android_nixpkgs = pkgs.callPackage
    (import (builtins.fetchGit {
      url = "https://github.com/tadfisher/android-nixpkgs.git";
    }))
    {
      channel = "stable";
    };
  android_sdk = android_nixpkgs.sdk (sdkPkgs: with sdkPkgs; [
    build-tools-35-0-0
    cmdline-tools-latest
    emulator
    extras-google-google-play-services
    platform-tools
    platforms-android-35
    system-images-android-35-google-apis-playstore-x86-64
  ]);
  android_sdk_path = "${android_sdk}/share/android-sdk";

  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/refs/heads/master.tar.gz";

  font_name = {
    mono = "NotoMono Nerd Font";
    sans_serif = "NotoSans Nerd Font";
    serif = "NotoSerif Nerd Font";
    emoji = "Noto Color Emoji";
  };

  dracula_theme = {
    hex = {
      background = "#282A36";
      current_line = "#44475A";
      foreground = "#F8F8F2";
      comment = "#6272A4";
      cyan = "#8BE9FD";
      green = "#50FA7B";
      orange = "#FFB86C";
      pink = "#FF79C6";
      purple = "#BD93F9";
      red = "#FF5555";
      yellow = "#F1FA8C";
    };

    rgba = {
      background = "rgba(40, 42, 54, 1.0)";
      current_line = "rgba(68, 71, 90, 1.0)";
      foreground = "rgba(248, 248, 242, 1.0)";
      comment = "rgba(98, 114, 164, 1.0)";
      cyan = "rgba(139, 233, 253, 1.0)";
      green = "rgba(80, 250, 123, 1.0)";
      orange = "rgba(255, 184, 108, 1.0)";
      pink = "rgba(255, 121, 198, 1.0)";
      purple = "rgba(189, 147, 249, 1.0)";
      red = "rgba(255, 85, 85, 1.0)";
      yellow = "rgba(241, 250, 140, 1.0)";
    };
  };

  cursor = {
    theme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };

    size = 24;
  };

  wallpaper = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/JaKooLit/Wallpaper-Bank/refs/heads/main/wallpapers/Dark_Nature.png";
  };
in
{
  home-manager = home-manager;
  font_name = font_name;
  dracula_theme = dracula_theme;
  cursor = cursor;
  wallpaper = wallpaper;
  android_sdk_path = android_sdk_path;
  android_sdk = android_sdk;
}