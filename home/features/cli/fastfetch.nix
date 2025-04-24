{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.cli.fastfetch;
in {
  options.features.cli.fastfetch.enable = mkEnableOption "enable fastfetch";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [fastfetch];
    programs.fastfetch = {
      enable = true;
      settings = {
        "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
        #logo = {
        # source = "~/.dotfiles/home-manager/apps/fastfetch/pngs/viking-axe-sticker.png";
        # height = 18;
        #};
        display = {
          separator = " : ";
        };
        modules = [
          {
            type = "command";
            key = "  ";
            keyColor = "blue";
            text = "splash=$(hyprctl splash);echo $splash";
          }
          {
            type = "custom";
            format = "┌──────────────────────────────────────────┐";
          }
          {
            type = "chassis";
            key = "  󰇺 Chassis";
            format = "{1} {2} {3}";
          }
          {
            type = "os";
            key = "  󰌽 OS";
            format = "{2}";
            keyColor = "red";
          }
          {
            type = "kernel";
            key = "   Kernel";
            format = "{2}";
            keyColor = "red";
          }
          {
            type = "packages";
            key = "  󰏗 Packages";
            keyColor = "green";
          }
          {
            type = "display";
            key = "  󰍹 Display";
            format = "{1}x{2} @ {3}Hz [{7}]";
            keyColor = "green";
          }
          {
            type = "terminal";
            key = "  >_ Terminal";
            keyColor = "yellow";
          }
          {
            type = "wm";
            key = "  󱗃 WM";
            format = "{2}";
            keyColor = "yellow";
          }
          {
            type = "custom";
            format = "└──────────────────────────────────────────┘";
          }
          "break"
          {
            type = "title";
            key = "  ";
            format = "{6} {7} {8}";
          }
          {
            type = "custom";
            format = "┌──────────────────────────────────────────┐";
          }
          {
            type = "cpu";
            format = "{1} @ {7}";
            key = "   CPU";
            keyColor = "blue";
          }
          {
            type = "gpu";
            format = "{1} {2}";
            key = "  󰊴 GPU";
            keyColor = "blue";
          }
          {
            type = "gpu";
            format = "{3}";
            key = "   GPU Driver";
            keyColor = "magenta";
          }
          {
            type = "memory";
            key = "   Memory";
            keyColor = "magenta";
          }
          {
            type = "disk";
            key = "  󱦟 OS Age ";
            folders = "/";
            keyColor = "red";
            format = "{days} days";
          }
          {
            type = "uptime";
            key = "  󱫐 Uptime ";
            keyColor = "red";
          }
          {
            type = "custom";
            format = "└──────────────────────────────────────────┘";
          }
          {
            type = "colors";
            paddingLeft = 2;
            symbol = "circle";
          }
          "break"
        ];
      };
    };
  };
}
