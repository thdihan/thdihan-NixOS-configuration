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
          rofi =
          let
            rofi_theme = pkgs.writeTextFile {
            name = "Rofi_Theme.rasi";
            text = ''
                  * {
                    margin: 0;
                    background-color: transparent;
                    padding: 0;
                    spacing: 0;
                    text-color: ${dracula_theme.hex.foreground};
                  }
                  window {
                    width: 768px;
                    border: 1px;
                    border-radius: 16px;
                    border-color: ${dracula_theme.hex.purple};
                    background-color: ${dracula_theme.hex.background};
                  }
                  mainbox {
                    padding: 16px;
                  }
                  inputbar {
                    border: 1px;
                    border-radius: 8px;
                    border-color: ${dracula_theme.hex.comment};
                    background-color: ${dracula_theme.hex.current_line};
                    padding: 8px;
                    spacing: 8px;
                    children: [ "prompt", "entry" ];
                  }
                  prompt {
                    text-color: ${dracula_theme.hex.foreground};
                  }
                  entry {
                    placeholder-color: ${dracula_theme.hex.comment};
                    placeholder: "Search";
                  }
                  listview {
                    margin: 16px 0px 0px 0px;
                    fixed-height: false;
                    lines: 8;
                    columns: 2;
                  }
                  element {
                    border-radius: 8px;
                    padding: 8px;
                    spacing: 8px;
                    children: [ "element-icon", "element-text" ];
                  }
                  element-icon {
                    vertical-align: 0.5;
                    size: 1em;
                  }
                  element-text {
                    text-color: inherit;
                  }
                  element.selected {
                    background-color: ${dracula_theme.hex.current_line};
                  }
                '';
              };
          in
            {
              enable = true;
              package = pkgs.rofi-wayland;
              plugins = with pkgs; [

              ];

              cycle = false;
              terminal = "${pkgs.kitty}/bin/kitty";

              location = "center";

              font = "${font_name.sans_serif} 11";

              extraConfig = {
                show-icons = true;
                display-drun = "Applications";

                disable-history = false;
              };

              theme = "${rofi_theme}";
            };
      };
    }
  ];
}