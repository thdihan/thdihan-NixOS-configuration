{pkgs,config,...}:
let

  global = import /etc/nixos/constants/global.nix {pkgs = pkgs; config = config; builtins = builtins;};
  home-manager = global.home-manager;
  cursor = global.cursor;
  font_name = global.font_name;
  wallpaper = global.wallpaper;
  dracula_theme = global.dracula_theme;
  
  packagesList = with pkgs; [
      acl
      agi
      aircrack-ng
      android-backup-extractor
      android-tools
      # android_sdk # Custom
      anydesk
      aribb24
      aribb25
      audacity
      audit
      avrdude
      bat
      bleachbit
      blender
      bluez
      bluez-tools
      bridge-utils
      brightnessctl
      btop
      btrfs-progs
      burpsuite
      butt
      bzip2
      certbot-full
      clang
      clinfo
      cliphist
      cloudflare-warp
      cmake
      coreutils-full
      cryptsetup
      cups
      cups-filters
      cups-pdf-to-pdf
      cups-printers
      curlFull
      curtail
      d-spy
      dart
      dbeaver-bin
      dconf-editor
      dmg2img
      dosfstools
      e2fsprogs
      esptool
      exfatprogs
      f2fs-tools
      faac
      faad2
      fastfetch
      fd
      fdk_aac
      ffmpeg-full
      ffmpegthumbnailer
      fh
      file
      flutter327
      fritzing
      fwupd-efi
      gcc
      gdb
      gh
      gimp-with-plugins
      git
      git-doc
      glib
      glibc
      gnome-font-viewer
      gnugrep
      gnulib
      gnumake
      gnutar
      gnused
      gnutls
      gource
      gparted
      gpredict
      gradle
      gradle-completion
      grim
      guestfs-tools
      gzip
      hfsprogs
      hw-probe
      hyprcursor
      hyprls
      hyprpicker
      hyprpolkitagent
      i2c-tools
      ideviceinstaller
      idevicerestore
      iftop
      image-roll
      inotify-tools
      jellyfin-media-player
      jfsutils
      john
      johnny
      jq
      keepassxc
      kind
      kubectl
      kubectl-graph
      kubectl-tree
      kubectl-view-allocations
      kubectl-view-secret
      kubernetes
      lhasa
      libGL
      libaom
      libappimage
      libde265
      libdvdcss
      libdvdnav
      libdvdread
      libfprint
      libfprint-tod
      libftdi1
      libgcc
      libgpg-error
      libguestfs
      libheif
      libideviceactivation
      libimobiledevice
      libnotify
      libopenraw
      libopus
      libosinfo
      libportal
      libreoffice-fresh
      libtinfo
      libusb1
      libuuid
      libva-utils
      libvirt
      libvpx
      libwebp
      libxfs
      lsof
      lvm2
      lynis
      mattermost-desktop
      memcached
      metasploit
      mixxx
      mtools
      nano
      networkmanagerapplet
      nilfs-utils
      ninja
      nix-bash-completions
      nix-diff
      nix-index
      nix-info
      nixos-icons
      nixpkgs-fmt
      nixpkgs-lint
      nixpkgs-review
      nmap
      ntfs3g
      nodejs_23
      obs-studio
      onedrive
      onionshare-gui
      openssl
      p7zip
      patchelf
      pavucontrol
      pciutils
      pcmanfm
      pcre
      pgadmin4-desktopmode
      pipewire
      pkg-config
      playerctl
      pnpm
      podman-compose
      podman-desktop
      podman-tui
      python313Full
      qbittorrent
      qemu-utils
      qpwgraph
      rar
      readline
      reiserfsprogs
      ripgrep
      rpPPPoE
      rtl-sdr-librtlsdr
      sane-backends
      schroedinger
      scrcpy
      screen
      sdrangel
      sdrpp
      slurp
      smartmontools
      social-engineer-toolkit
      spice-gtk
      spice-protocol
      superfile
      swtpm
      telegram-desktop
      texliveFull
      thermald
      tor-browser
      tree
      tree-sitter
      udftools
      unar
      undollar
      ungoogled-chromium
      unicode-emoji
      universal-android-debloater
      unrar
      unzip
      usbtop
      usbutils
      util-linux
      virt-viewer
      virtio-win
      virtiofsd
      vlc
      vlc-bittorrent
      vscode-js-debug
      waybar-mpris
      waycheck
      waydroid
      wayland
      wayland-protocols
      wayland-utils
      waylevel
      wev
      wget
      which
      wireplumber
      wireshark
      wl-clipboard
      wordpress
      wpscan
      x264
      x265
      xarchiver
      xdg-user-dirs
      xdg-utils
      xfsdump
      xfstests
      xfsprogs
      xorg.xhost
      xoscope
      xvidcore
      yaml-language-server
      yt-dlp
      zip
      (sddm-astronaut.override {
        embeddedTheme = "astronaut";

        themeConfig = {
          # ScreenWidth = 1920;
          # ScreenHeight = 1080;
          ScreenPadding = 0;

          BackgroundColor = dracula_theme.hex.background;
          BackgroundHorizontalAlignment = "center";
          BackgroundVerticalAlignment = "center";
          Background = wallpaper;
          CropBackground = false;
          DimBackgroundImage = "0.0";

          FullBlur = false;
          PartialBlur = false;

          HaveFormBackground = false;
          FormPosition = "center";

          HideLoginButton = false;
          HideSystemButtons = false;
          HideVirtualKeyboard = false;
          VirtualKeyboardPosition = "center";

          # MainColor = ;
          # AccentColor = ;

          # HighlightBorderColor= ;
          # HighlightBackgroundColor= ;
          # HighlightTextColor= ;

          HeaderTextColor = dracula_theme.hex.foreground;
          TimeTextColor = dracula_theme.hex.foreground;
          DateTextColor = dracula_theme.hex.foreground;

          IconColor = dracula_theme.hex.foreground;
          PlaceholderTextColor = dracula_theme.hex.foreground;
          WarningColor = dracula_theme.hex.red;

          # LoginFieldBackgroundColor = ;
          # LoginFieldTextColor = ;
          # UserIconColor = ;
          # HoverUserIconColor = ;

          # PasswordFieldBackgroundColor = ;
          # PasswordFieldTextColor = ;
          # PasswordIconColor = ;
          # HoverPasswordIconColor = ;

          # LoginButtonBackgroundColor = ;
          LoginButtonTextColor = dracula_theme.hex.foreground;

          SystemButtonsIconsColor = dracula_theme.hex.foreground;
          # HoverSystemButtonsIconsColor = ;

          SessionButtonTextColor = dracula_theme.hex.foreground;
          # HoverSessionButtonTextColor = ;

          VirtualKeyboardButtonTextColor = dracula_theme.hex.foreground;
          # HoverVirtualKeyboardButtonTextColor = ;

          DropdownBackgroundColor = dracula_theme.hex.background;
          DropdownSelectedBackgroundColor = dracula_theme.hex.current_line;
          DropdownTextColor = dracula_theme.hex.foreground;

          HeaderText = "Welcome";

          HourFormat = "\"hh:mm A\"";
          DateFormat = "\"MMMM dd, yyyy\"";

          PasswordFocus = true;
          AllowEmptyPassword = false;
        };
      })
    ] ++
    (with unixtools; [
      arp
      ifconfig
      netstat
      nettools
      ping
      route
      util-linux
      whereis
    ])
    ++
    (with gst_all_1; [
      gst-libav
      gst-plugins-bad
      gst-plugins-base
      gst-plugins-good
      gst-plugins-ugly
      gst-vaapi
      gstreamer
    ])
    ++
    (with python313Packages; [
      black
      datetime
      matplotlib
      numpy
      pandas
      pillow
      pip
      pyserial
      requests
      seaborn
      tkinter
    ]) ++
    (with texlivePackages; [
      latexmk
    ]) ++
    (with tree-sitter-grammars; [
      tree-sitter-bash
      tree-sitter-c
      tree-sitter-cmake
      tree-sitter-comment
      tree-sitter-cpp
      tree-sitter-css
      tree-sitter-dart
      tree-sitter-dockerfile
      tree-sitter-html
      tree-sitter-http
      tree-sitter-javascript
      tree-sitter-json
      tree-sitter-latex
      tree-sitter-make
      tree-sitter-markdown
      tree-sitter-markdown-inline
      tree-sitter-nix
      tree-sitter-php
      tree-sitter-python
      tree-sitter-regex
      tree-sitter-sql
      tree-sitter-toml
      tree-sitter-yaml
    ]);
in
{
    environment.systemPackages = packagesList;
}