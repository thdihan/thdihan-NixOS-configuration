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
                    waybar = {
            enable = true;
            systemd = {
              enable = true;
              # target = ;
            };

            settings = {
              top_bar = {
                start_hidden = false;
                reload_style_on_change = true;
                position = "top";
                exclusive = true;
                layer = "top";
                passthrough = false;
                fixed-center = true;
                spacing = 4;

                modules-left = [
                  "power-profiles-daemon"
                  "idle_inhibitor"
                  "backlight"
                  "pulseaudio"
                  "bluetooth"
                  "network"
                ];

                modules-center = [
                  "clock"
                ];

                modules-right = [
                  "privacy"
                  "keyboard-state"
                  "systemd-failed-units"
                  "disk"
                  "memory"
                  "cpu"
                  "battery"
                ];

                power-profiles-daemon = {
                  format = "{icon}";
                  format-icons = {
                    performance = "";
                    balanced = "";
                    power-saver = "";
                  };

                  tooltip = true;
                  tooltip-format = "Driver: {driver}\nProfile: {profile}";
                };

                idle_inhibitor = {
                  start-activated = false;

                  format = "{icon}";
                  format-icons = {
                    activated = "";
                    deactivated = "";
                  };

                  tooltip = true;
                  tooltip-format-activated = "{status}";
                  tooltip-format-deactivated = "{status}";
                };

                backlight = {
                  device = "intel_backlight";
                  interval = 1;

                  format = "{percent}% {icon}";
                  format-icons = [
                    ""
                    ""
                    ""
                    ""
                    ""
                    ""
                    ""
                    ""
                    ""
                  ];

                  tooltip = true;
                  tooltip-format = "{percent}% {icon}";

                  on-scroll-up = "brightnessctl s +1%";
                  on-scroll-down = "brightnessctl s 1%-";
                  reverse-scrolling = false;
                  reverse-mouse-scrolling = false;
                  scroll-step = 1.0;
                };

                pulseaudio = {
                  format = "{volume}% {icon} {format_source}";
                  format-muted = "{icon} {format_source}";

                  format-bluetooth = "{volume}% {icon} 󰂱 {format_source}";
                  format-bluetooth-muted = "{icon} 󰂱 {format_source}";

                  format-source = " {volume}% ";
                  format-source-muted = "";

                  format-icons = {
                    default = [
                      ""
                      ""
                      ""
                    ];
                    default-muted = "";

                    speaker = "󰓃";
                    speaker-muted = "󰓄";

                    headphone = "󰋋";
                    headphone-muted = "󰟎";

                    headset = "󰋎";
                    headset-muted = "󰋐";

                    hands-free = "󰏳";
                    hands-free-muted = "󰗿";

                    phone = "";
                    phone-muted = "";

                    portable = "";
                    portable-muted = "";

                    hdmi = "󰽟";
                    hdmi-muted = "󰽠";

                    hifi = "󰴸";
                    hifi-muted = "󰓄";

                    car = "󰄋";
                    car-muted = "󰸜";
                  };

                  tooltip = true;
                  tooltip-format = "{desc}";

                  scroll-step = 1.0;
                  reverse-scrolling = false;
                  reverse-mouse-scrolling = false;
                  max-volume = 100;
                  on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+";
                  on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-";

                  on-click = "pavucontrol";
                };

                bluetooth = {
                  format = "{status} {icon}";
                  format-disabled = "Disabled {icon}";
                  format-off = "Off {icon}";
                  format-on = "On {icon}";
                  format-connected = "{device_alias} {icon}";
                  format-connected-battery = "{device_alias} 󰂱 ({device_battery_percentage}%)";
                  format-icons = {
                    no-controller = "󰂲";
                    disabled = "󰂲";
                    off = "󰂲";
                    on = "󰂯";
                    connected = "󰂱";
                  };

                  tooltip = true;
                  tooltip-format = "Status: {status}\nController Address: {controller_address} ({controller_address_type})\nController Alias: {controller_alias}";
                  tooltip-format-disabled = "Status: Disabled";
                  tooltip-format-off = "Status: Off";
                  tooltip-format-on = "Status: On\nController Address: {controller_address} ({controller_address_type})\nController Alias: {controller_alias}";
                  tooltip-format-connected = "Status: Connected\nController Address: {controller_address} ({controller_address_type})\nController Alias: {controller_alias}\nConnected Devices ({num_connections}): {device_enumerate}";
                  tooltip-format-connected-battery = "Status: Connected\nController Address: {controller_address} ({controller_address_type})\nController Alias: {controller_alias}\nConnected Devices ({num_connections}): {device_enumerate}";
                  tooltip-format-enumerate-connected = "\n\tAddress: {device_address} ({device_address_type})\n\tAlias: {device_alias}";
                  tooltip-format-enumerate-connected-battery = "\n\tAddress: {device_address} ({device_address_type})\n\tAlias: {device_alias}\n\tBattery: {device_battery_percentage}%";

                  on-click = "uwsm app -- blueman-manager";
                };

                network = {
                  interval = 1;

                  format = "{bandwidthUpBytes} {bandwidthDownBytes}";
                  format-disconnected = "Disconnected 󱘖";
                  format-linked = "No IP 󰀦";
                  format-ethernet = "{bandwidthUpBytes}   {bandwidthDownBytes}";
                  format-wifi = "{bandwidthUpBytes}   {bandwidthDownBytes}";

                  tooltip = true;
                  tooltip-format = "Interface: {ifname}\nGateway: {gwaddr}\nSubnet Mask: {netmask}\nCIDR Notation: {cidr}\nIP Address: {ipaddr}\nUp Speed: {bandwidthUpBytes}\nDown Speed: {bandwidthDownBytes}\nTotal Speed: {bandwidthTotalBytes}";
                  tooltip-format-disconnected = "Disconnected";
                  tooltip-format-ethernet = "Interface: {ifname}\nGateway: {gwaddr}\nSubnet Mask: {netmask}\nCIDR Notation= {cidr}\nIP Address: {ipaddr}\nUp Speed: {bandwidthUpBytes}\nDown Speed: {bandwidthDownBytes}\nTotal Speed: {bandwidthTotalBytes}";
                  tooltip-format-wifi = "Interface: {ifname}\nESSID: {essid}\nFrequency: {frequency} GHz\nStrength: {signaldBm} dBm ({signalStrength}%)\nGateway: {gwaddr}\nSubnet Mask: {netmask}\nCIDR Notation: {cidr}\nIP Address: {ipaddr}\nUp Speed: {bandwidthUpBytes}\nDown Speed: {bandwidthDownBytes}\nTotal Speed: {bandwidthTotalBytes}";

                  on-click = "nm-connection-editor";
                };

                clock = {
                  timezone = config.time.timeZone;
                  locale = "en_US";
                  interval = 1;

                  format = "{:%I:%M:%S %p}";
                  format-alt = "{:%A, %B %d, %Y}";

                  tooltip = true;
                  tooltip-format = "<tt><small>{calendar}</small></tt>";

                  calendar = {
                    mode = "year";
                    mode-mon-col = 3;
                    weeks-pos = "right";

                    format = {
                      months = "<b>{}</b>";
                      days = "{}";
                      weekdays = "<b>{}</b>";
                      weeks = "<i>{:%U}</i>";
                      today = "<u>{}</u>";
                    };
                  };
                };

                privacy = {
                  icon-size = 14;
                  icon-spacing = 8;
                  transition-duration = 200;

                  modules = [
                    {
                      type = "screenshare";
                      tooltip = true;
                      tooltip-icon-size = 16;
                    }
                    {
                      type = "audio-in";
                      tooltip = true;
                      tooltip-icon-size = 16;
                    }
                    {
                      type = "audio-out";
                      tooltip = true;
                      tooltip-icon-size = 16;
                    }
                  ];
                };

                keyboard-state = {
                  capslock = true;
                  numlock = true;

                  format = {
                    capslock = "󰪛";
                    numlock = "󰎦";
                  };
                };

                systemd-failed-units = {
                  system = true;
                  user = true;

                  hide-on-ok = false;

                  format = "{nr_failed_system}, {nr_failed_user} ";
                  format-ok = "";
                };

                disk = {
                  path = "/";
                  unit = "GB";
                  interval = 1;

                  format = "{percentage_used}% 󰋊";

                  tooltip = true;
                  tooltip-format = "Total: {specific_total} GB\nUsed: {specific_used} GB ({percentage_used}%)\nFree: {specific_free} GB ({percentage_free}%)";

                  on-click = "kitty sh -c \"btop\"";
                };

                memory = {
                  interval = 1;

                  format = "{percentage}% ";

                  tooltip = true;
                  tooltip-format = "Used RAM: {used} GiB ({percentage}%)\nUsed Swap: {swapUsed} GiB ({swapPercentage}%)\nAvailable RAM: {avail} GiB\nAvailable Swap: {swapAvail} GiB";

                  on-click = "kitty sh -c \"btop\"";
                };

                cpu = {
                  interval = 1;

                  format = "{usage}% ";

                  tooltip = true;

                  on-click = "kitty sh -c \"btop\"";
                };

                battery = {
                  bat = "BAT1";
                  adapter = "ACAD";
                  design-capacity = false;
                  weighted-average = true;
                  interval = 1;

                  full-at = 100;
                  states = {
                    warning = 25;
                    critical = 10;
                  };

                  format = "{capacity}% {icon}";
                  format-plugged = "{capacity}% ";
                  format-charging = "{capacity}% ";
                  format-full = "{capacity}% {icon}";
                  format-alt = "{time} {icon}";
                  format-time = "{H} h {m} min";
                  format-icons = [
                    ""
                    ""
                    ""
                    ""
                    ""
                  ];

                  tooltip = true;
                  tooltip-format = "Capacity: {capacity}%\nPower: {power} W\n{timeTo}\nCycles: {cycles}\nHealth: {health}%";

                  on-click = "kitty sh -c \"btop\"";
                };
              };

              bottom_bar = {
                start_hidden = false;
                reload_style_on_change = true;
                position = "bottom";
                exclusive = true;
                layer = "top";
                passthrough = false;
                fixed-center = true;
                spacing = 0;

                modules-left = [
                  "hyprland/workspaces"
                  "wlr/taskbar"
                ];

                modules-center = [
                  "hyprland/window"
                ];

                modules-right = [
                  "tray"
                ];

                "hyprland/workspaces" = {
                  all-outputs = false;
                  show-special = true;
                  special-visible-only = false;
                  active-only = false;
                  format = "{name}";
                  move-to-monitor = false;
                };

                "wlr/taskbar" = {
                  all-outputs = false;
                  active-first = false;
                  sort-by-app-id = false;
                  format = "{icon}";
                  icon-theme = "Dracula";
                  icon-size = 14;
                  markup = true;

                  tooltip = true;
                  tooltip-format = "Title: {title}\nName: {name}\nID: {app_id}\nState: {state}";

                  on-click = "activate";
                };

                "hyprland/window" = {
                  separate-outputs = true;
                  icon = false;

                  format = "{title}";
                };

                tray = {
                  show-passive-items = true;
                  reverse-direction = false;
                  icon-size = 14;
                  spacing = 4;
                };
              };
            };

            style = ''
              * {
                font-family: ${font_name.sans_serif};
                font-size: 14px;
              }

              window#waybar {
                border: none;
                background-color: transparent;
              }

              .modules-right > widget:last-child > #workspaces {
                margin-right: 0;
              }

              .modules-left > widget:first-child > #workspaces {
                margin-left: 0;
              }

              #power-profiles-daemon,
              #idle_inhibitor,
              #backlight,
              #pulseaudio,
              #bluetooth,
              #network,
              #keyboard-state,
              #clock,
              #privacy,
              #systemd-failed-units,
              #disk,
              #memory,
              #cpu,
              #battery,
              #window {
                border-radius: 16px;
                background-color: ${dracula_theme.hex.background};
                padding: 2px 8px;
                color: ${dracula_theme.hex.foreground};
              }

              #power-profiles-daemon.power-saver {
                color: ${dracula_theme.hex.green};
              }

              #power-profiles-daemon.balanced {
                color: ${dracula_theme.hex.cyan};
              }

              #power-profiles-daemon.performance {
                color: ${dracula_theme.hex.foreground};
              }

              #idle_inhibitor.deactivated {
                color: ${dracula_theme.hex.foreground};
              }

              #idle_inhibitor.activated {
                color: ${dracula_theme.hex.cyan};
              }

              #pulseaudio.muted,
              #pulseaudio.source-muted {
                color: ${dracula_theme.hex.red};
              }

              #pulseaudio.bluetooth {
                color: ${dracula_theme.hex.foreground};
              }

              #bluetooth.no-controller,
              #bluetooth.disabled,
              #bluetooth.off {
                color: ${dracula_theme.hex.red};
              }

              #bluetooth.on,
              #bluetooth.discoverable,
              #bluetooth.pairable {
                color: ${dracula_theme.hex.foreground};
              }

              #bluetooth.discovering,
              #bluetooth.connected {
                color: ${dracula_theme.hex.cyan};
              }

              #network.disabled,
              #network.disconnected,
              #network.linked {
                color: ${dracula_theme.hex.red};
              }

              #network.etherenet,
              #network.wifi {
                color: ${dracula_theme.hex.foreground};
              }

              #privacy-item.audio-out {
                color: ${dracula_theme.hex.foreground};
              }

              #privacy-item.audio-in,
              #privacy-item.screenshare {
                color: ${dracula_theme.hex.cyan};
              }

              #keyboard-state label {
                margin: 0px 4px;
              }

              #keyboard-state label.locked {
                color: ${dracula_theme.hex.cyan};
              }

              #systemd-failed-units.ok {
                color: ${dracula_theme.hex.foreground};
              }

              #systemd-failed-units.degraded {
                color: ${dracula_theme.hex.red};
              }

              #battery.plugged,
              #battery.full {
                color: ${dracula_theme.hex.foreground};
              }

              #battery.charging {
                color: ${dracula_theme.hex.cyan};
              }

              #battery.warning {
                color: ${dracula_theme.hex.yellow};
              }

              #battery.critical {
                color: ${dracula_theme.hex.red};
              }

              #workspaces,
              #taskbar,
              #tray {
                background-color: transparent;
              }

              button {
                margin: 0px 2px;
                border-radius: 16px;
                background-color: ${dracula_theme.hex.background};
                padding: 0px;
                color: ${dracula_theme.hex.foreground};
              }

              button * {
                padding: 0px 4px;
              }

              button.active {
                background-color: ${dracula_theme.hex.current_line};
              }

              #window label {
                padding: 0px 4px;
                font-size: 11px;
              }

              #tray > widget {
                border-radius: 16px;
                background-color: ${dracula_theme.hex.background};
                color: ${dracula_theme.hex.foreground};
              }

              #tray image {
                padding: 0px 8px;
              }

              #tray > .passive {
                -gtk-icon-effect: dim;
              }

              #tray > .active {
                background-color: ${dracula_theme.hex.current_line};
              }

              #tray > .needs-attention {
                background-color: ${dracula_theme.hex.comment};
                -gtk-icon-effect: highlight;
              }

              #tray > widget:hover {
                background-color: ${dracula_theme.hex.current_line};
              }
            '';
          };
      };
    }
  ];
}