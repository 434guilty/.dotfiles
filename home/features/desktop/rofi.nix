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
        show-icons = true;
        display-drun = "";
        drun-display-format = "{name}";
      };
      theme = let
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        "*" = {
          font = "JetBrainsMono Nerd Font Mono 10";
          background = mkLiteral "#1E1D2FFF";
          background-alt = mkLiteral "#282839FF";
          foreground = mkLiteral "#D9E0EEFF";
          selected = mkLiteral "#7AA2F7FF";
          active = mkLiteral "#ABE9B3FF";
          urgent = mkLiteral "#F28FADFF";
        };

        window = {
          transparency = "real";
          location = mkLiteral "center";
          anchor = mkLiteral "center";
          fullscreen = mkLiteral "false";
          width = mkLiteral "750px";
          x-offset = mkLiteral "0px";
          y-offset = mkLiteral "0px";

          enabled = mkLiteral "true";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "12px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "black / 10%";
          cursor = "default";
        };

        mainbox = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "20px";
          margin = mkLiteral "0px";
          padding = mkLiteral "20px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px 0px 0px 0px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "transparent";
          children = map mkLiteral ["inputbar" "listview"];
        };

        inputbar = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "5px";
          margin = mkLiteral "0px";
          padding = mkLiteral "15px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "10px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "white / 5%";
          text-color = mkLiteral "@foreground";
          children = map mkLiteral ["prompt" "entry"];
        };

        prompt = {
          enabled = mkLiteral "true";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
        };
        textbox-prompt-colon = {
          enabled = mkLiteral "true";
          expand = mkLiteral "false";
          str = "::";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
        };
        entry = {
          enabled = mkLiteral "true";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "text";
          placeholder = "Search";
          placeholder-color = mkLiteral "inherit";
        };

        listview = {
          enabled = mkLiteral "true";
          columns = mkLiteral "5";
          lines = mkLiteral "3";
          cycle = mkLiteral "true";
          dynamic = mkLiteral "true";
          scrollbar = mkLiteral "false";
          layout = mkLiteral "vertical";
          reverse = mkLiteral "false";
          fixed-height = mkLiteral "true";
          fixed-columns = mkLiteral "true";

          spacing = mkLiteral "0px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
          cursor = "default";
        };
        scrollbar = {
          handle-width = mkLiteral "5px";
          handle-color = mkLiteral "@selected";
          border-radius = mkLiteral "0px";
          background-color = mkLiteral "@background-alt";
        };

        element = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "15px";
          margin = mkLiteral "0px";
          padding = mkLiteral "20px 10px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "10px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
          orientation = mkLiteral "vertical";
          cursor = mkLiteral "pointer";
        };
        "element normal.normal" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
        };
        "element selected.normal" = {
          background-color = mkLiteral "white / 5%";
          text-color = mkLiteral "@foreground";
        };
        element-icon = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          size = mkLiteral "64px";
          cursor = mkLiteral "inherit";
        };
        element-text = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          highlight = mkLiteral "inherit";
          cursor = mkLiteral "inherit";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.5";
        };

        error-message = {
          padding = mkLiteral "15px";
          border = mkLiteral "2px solid";
          border-radius = mkLiteral "10px";
          border-color = mkLiteral "@selected";
          background-color = mkLiteral "black / 10%";
          text-color = mkLiteral "@foreground";
        };
        textbox = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
          highlight = mkLiteral "none";
        };
      };
    };
  };
}
