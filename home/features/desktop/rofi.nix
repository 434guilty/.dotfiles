{
  pkgs,
  config,
  ...
}: {
  programs = {
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      extraConfig = {
        modi = "drun,filebrowser,run";
        #show-icons = true;
        drun-display-format = "{icon} {name}";
      };
      theme = let
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        "window" = {
          transparency = "real";
          width = mkLiteral "30%";
          location = mkLiteral "center";
          cursor = "default";
          enabled = true;
          #border-radius = mkLiteral "15px";
        };
        "inputbar" = {
          enabled = true;
          spacing = mkLiteral "8px";
          padding = mkLiteral "8px";
          #border-radius = mkLiteral "10px";
        };
        "entry" = {
          enabled = true;
          vertical-align = mkLiteral "0.5";
        };
        "listview" = {
          enabled = true;
          columns = 1;
          lines = 6;
          dynamic = true;
          scrollbar = false;
          fixed-height = false;
        };
        "element" = {
          enabled = true;
          spacing = mkLiteral "8px";
          padding = mkLiteral "4px";
        };
        "element normal.normal" = {
        };
        "element normal.urgent" = {
        };
        "element normal.active" = {
        };
        "element selected" = {
        };
        "element selected.normal" = {
        };
        "element selected.urgent" = {
        };
        "element selected.active" = {
        };
        "element-icon" = {
          size = mkLiteral "0.8em";
          vertical-align = mkLiteral "0.5";
        };
        "element-text" = {
          cursor = mkLiteral "inherit";
          vertical-align = mkLiteral "0.5";
        };
        "textbox" = {
          padding = mkLiteral "8px";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
        };
      };
    };
  };
}
