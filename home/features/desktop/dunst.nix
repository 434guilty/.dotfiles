{
  config,
  lib,
  pkgs,
  ...
}: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        browser = "${config.programs.firefox.package}/bin/firefox -new-tab";
        dmenu = "${pkgs.rofi-wayland}/bin/rofi -dmenu";
        follow = "mouse";
        enable_posix_regex = true;
        format = "%s\n%b";
        frame_width = 3;
        sort = "yes";
        geometry = "300x5-5+30";
        scale = 0;
        text_icon_padding = 10;
        notification_limit = 20;
        indicate_hidden = "yes";
        horizontal_padding = 8;
        progress_bar = true;
        show_indicators = "yes";
        progress_bar_height = 10;
        progress_bar_frame_width = 0;
        progress_bar_min_width = 125;
        progress_bar_max_width = 250;
        progress_bar_corner_radius = 4;
        icon_corner_radius = 10;
        corner_radius = 5;
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 128;
        line_height = 0;
        markup = "full";
        padding = 8;
        separator_height = 2;
        gap_size = 5;
        transparency = 10;
        word_wrap = true;
      };

      Type-1 = {
        appname = "t1";
        format = "<b>%s</b>";
      };

      Type-2 = {
        appname = "t2";
        format = ''<span size="250%">%s</span>\n%b'';
      };

      urgency_low = {
        timeout = 10;
        icon = "$HOME/.config/dunst/icons/hyprdots.svg";
        #frame_color = "#6591A303";
      };

      urgency_normal = {
        timeout = 15;
        #frame_color = "#3A4A6B03";
      };

      urgency_critical = {
        timeout = 0;
        #frame_color = "#f38ba8";
      };
    };
  };

  # …
}
