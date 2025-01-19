{pkgs, config, ...}:
let
  global = import /etc/nixos/constants/global.nix {pkgs = pkgs; config = config; builtins = builtins;};
  home-manager = global.home-manager;
  cursor = global.cursor;
  font_name = global.font_name;
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.sharedModules = [
    {
       wayland.windowManager.hyprland = {
          enable = true;

          systemd = {
            enable = false;
            enableXdgAutostart = true;
          };

          plugins = [

          ];

          xwayland.enable = true;

          sourceFirst = true;

          settings = {
            monitor = [
              ", highres, auto, 1.25" # Name, Resolution, Position, Scale
            ];

            env = [
              "XCURSOR_SIZE, ${toString cursor.size}"
            ];

            exec-once = [
              "sleep 2 && uwsm app -- keepassxc"

              "wl-paste --type text --watch cliphist store"
              "wl-paste --type image --watch cliphist store"

              "setfacl --modify user:jellyfin:--x ~ & adb start-server &"

              "systemctl --user start warp-taskbar"
            ];

            bind = [
              "SUPER, L, exec, hyprlock --immediate"
              "SUPER CTRL, L, exec, uwsm stop"
              "SUPER CTRL, P, exec, systemctl poweroff"
              "SUPER CTRL, R, exec, systemctl reboot"

              "SUPER, 1, workspace, 1"
              "SUPER, 2, workspace, 2"
              "SUPER, 3, workspace, 3"
              "SUPER, 4, workspace, 4"
              "SUPER, 5, workspace, 5"
              "SUPER, 6, workspace, 6"
              "SUPER, 7, workspace, 7"
              "SUPER, 8, workspace, 8"
              "SUPER, 9, workspace, 9"
              "SUPER, 0, workspace, 10"
              "SUPER, mouse_down, workspace, e+1"
              "SUPER, mouse_up, workspace, e-1"
              "SUPER, S, togglespecialworkspace, magic"

              "SUPER, left, movefocus, l"
              "SUPER, right, movefocus, r"
              "SUPER, up, movefocus, u"
              "SUPER, down, movefocus, d"

              "SUPER SHIFT, T, togglesplit,"
              "SUPER SHIFT, F, togglefloating,"
              ", F11, fullscreen, 0"
              "SUPER, Q, killactive,"

              "SUPER SHIFT, 1, movetoworkspace, 1"
              "SUPER SHIFT, 2, movetoworkspace, 2"
              "SUPER SHIFT, 3, movetoworkspace, 3"
              "SUPER SHIFT, 4, movetoworkspace, 4"
              "SUPER SHIFT, 5, movetoworkspace, 5"
              "SUPER SHIFT, 6, movetoworkspace, 6"
              "SUPER SHIFT, 7, movetoworkspace, 7"
              "SUPER SHIFT, 8, movetoworkspace, 8"
              "SUPER SHIFT, 9, movetoworkspace, 9"
              "SUPER SHIFT, 0, movetoworkspace, 10"
              "SUPER SHIFT, S, movetoworkspace, special:magic"

              "SUPER SHIFT ALT, 1, movetoworkspacesilent, 1"
              "SUPER SHIFT ALT, 2, movetoworkspacesilent, 2"
              "SUPER SHIFT ALT, 3, movetoworkspacesilent, 3"
              "SUPER SHIFT ALT, 4, movetoworkspacesilent, 4"
              "SUPER SHIFT ALT, 5, movetoworkspacesilent, 5"
              "SUPER SHIFT ALT, 6, movetoworkspacesilent, 6"
              "SUPER SHIFT ALT, 7, movetoworkspacesilent, 7"
              "SUPER SHIFT ALT, 8, movetoworkspacesilent, 8"
              "SUPER SHIFT ALT, 9, movetoworkspacesilent, 9"
              "SUPER SHIFT ALT, 0, movetoworkspacesilent, 10"
              "SUPER SHIFT ALT, S, movetoworkspacesilent, special:magic"

              "SUPER SHIFT, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

              ", PRINT, exec, filename=\"$(xdg-user-dir DOWNLOAD)/Screenshot_$(date +'%Y-%B-%d_%I-%M-%S_%p').png\"; grim -g \"$(slurp -d)\" -t png -l 9 \"$filename\" && wl-copy < \"$filename\""

              "SUPER, R, exec, rofi -show drun"
              "SUPER SHIFT, R, exec, rofi -show run"

              "SUPER, T, exec, kitty"
              "SUPER ALT, T, exec, kitty sh -c \"fish\""

              ", XF86Explorer, exec, pcmanfm"
              "SUPER, E, exec, pcmanfm"

              "SUPER, F, exec, kitty --hold sh -c \"fastfetch --thread true --detect-version true --logo-preserve-aspect-ratio true --temp-unit c --title-fqdn true --disk-show-regular true --disk-show-external true --disk-show-hidden true --disk-show-subvolumes true --disk-show-readonly true --disk-show-unknown true --physicaldisk-temp true --bluetooth-show-disconnected true --display-precise-refresh-rate true --cpu-temp true --cpu-show-pe-core-count true --cpuusage-separate true --gpu-temp true --gpu-driver-specific true --battery-temp true --localip-show-ipv4 true --localip-show-ipv6 true --localip-show-mac true --localip-show-loop true --localip-show-mtu true --localip-show-speed true --localip-show-prefix-len true --localip-show-all-ips true --localip-show-flags true --wm-detect-plugin true\""

              "SUPER, B, exec, kitty sh -c \"btop\""

              "SUPER, W, exec, firefox"
              "SUPER ALT, W, exec, firefox --private-window"

              ", XF86Mail, exec, thunderbird"
              "SUPER, M, exec, thunderbird"

              "SUPER, C, exec, code"
              "SUPER, D, exec, dbeaver"

              "SUPER, V, exec, vlc"
            ];

            bindm = [
              "SUPER, mouse:272, movewindow"
              "SUPER, mouse:273, resizewindow"
            ];

            bindl = [
              ", XF86AudioPlay, exec, playerctl play-pause"
              ", XF86AudioPause, exec, playerctl play-pause"
              ", XF86AudioStop, exec, playerctl stop"

              ", XF86AudioPrev, exec, playerctl previous"
              ", XF86AudioNext, exec, playerctl next"
            ];

            bindel = [
              ", XF86MonBrightnessUp, exec, brightnessctl s 1%+"
              ", XF86MonBrightnessDown, exec, brightnessctl s 1%-"

              ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"
              ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"
              ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
              ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            ];

            general = {
              allow_tearing = false;

              gaps_workspaces = 0;

              layout = "dwindle";

              gaps_in = 2;
              gaps_out = 4;

              no_border_on_floating = false;

              border_size = 1;
              "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
              "col.inactive_border" = "rgba(595959aa)";

              no_focus_fallback = false;

              resize_on_border = true;
              hover_icon_on_border = true;
            };

            misc = {
              disable_autoreload = false;

              allow_session_lock_restore = true;

              key_press_enables_dpms = true;
              mouse_move_enables_dpms = true;

              vfr = true;
              vrr = 1;

              render_ahead_of_time = false;

              mouse_move_focuses_monitor = true;

              disable_hyprland_logo = false;
              force_default_wallpaper = 1;
              disable_splash_rendering = true;

              font_family = font_name.sans_serif;

              close_special_on_empty = true;

              animate_mouse_windowdragging = false;
              animate_manual_resizes = false;

              exit_window_retains_fullscreen = false;

              layers_hog_keyboard_focus = true;

              focus_on_activate = false;

              middle_click_paste = true;
            };

            dwindle = {
              pseudotile = false;

              use_active_for_splits = true;
              force_split = 0; # Follows Mouse
              smart_split = false;
              preserve_split = true;

              smart_resizing = true;
            };

            xwayland = {
              enabled = true;
              force_zero_scaling = true;
              use_nearest_neighbor = true;
            };

            windowrulev2 = [
              "suppressevent maximize, class:.*"
              "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
            ];

            input = {
              kb_layout = "us";

              numlock_by_default = true;

              follow_mouse = 1;
              focus_on_close = 1;

              left_handed = false;
              sensitivity = 0.6; # Mouse
              natural_scroll = false;

              touchpad = {
                natural_scroll = true;

                tap-to-click = true;
                tap-and-drag = true;
                drag_lock = true;

                disable_while_typing = true;
              };

              touchdevice =
                {
                  enabled = true;
                };

              tablet = {
                left_handed = false;
              };
            };

            gestures = {
              # Touchpad
              workspace_swipe = true;
              workspace_swipe_invert = true;

              # Touchscreen
              workspace_swipe_touch = false;
              workspace_swipe_touch_invert = false;

              workspace_swipe_create_new = true;
              workspace_swipe_forever = true;
            };

            decoration = {
              rounding = 10;

              active_opacity = 1.0;
              inactive_opacity = 1.0;

              shadow = {
                enabled = true;
                range = 4;
                render_power = 3;
                color = "rgba(1a1a1aee)";
              };

              blur = {
                enabled = true;
                size = 3;
                passes = 1;

                vibrancy = 0.1696;
              };
            };

            animations = {
              enabled = "yes";

              bezier = [
                "easeOutQuint,0.23,1,0.32,1"
                "easeInOutCubic,0.65,0.05,0.36,1"
                "linear,0,0,1,1"
                "almostLinear,0.5,0.5,0.75,1.0"
                "quick,0.15,0,0.1,1"
              ];

              animation = [
                "global, 1, 10, default"
                "border, 1, 5.39, easeOutQuint"
                "windows, 1, 4.79, easeOutQuint"
                "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
                "windowsOut, 1, 1.49, linear, popin 87%"
                "fadeIn, 1, 1.73, almostLinear"
                "fadeOut, 1, 1.46, almostLinear"
                "fade, 1, 3.03, quick"
                "layers, 1, 3.81, easeOutQuint"
                "layersIn, 1, 4, easeOutQuint, fade"
                "layersOut, 1, 1.5, linear, fade"
                "fadeLayersIn, 1, 1.79, almostLinear"
                "fadeLayersOut, 1, 1.39, almostLinear"
                "workspaces, 1, 1.94, almostLinear, fade"
                "workspacesIn, 1, 1.21, almostLinear, fade"
                "workspacesOut, 1, 1.94, almostLinear, fade"
              ];
            };
          };

          extraConfig = '' '';
        };
    }
  ];
}