{
  pkgs,
  lib,
  host,
  config,
  ...
}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = [
      {
        layer = "top";
        position = "top";
        mod = "dock";
        height = 32;
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        reload_style_on_change = true;
        modules-left = [
          "custom/padd"
          "custom/l_end"
          "custom/power"
          "custom/r_end"
          "custom/l_end"
          "wlr/taskbar"
          "custom/r_end"
          "custom/padd"
        ];
        modules-center = [
          "custom/padd"
          "custom/l_end"
          "idle_inhibitor"
          "clock"
          "custom/r_end"
          "custom/padd"
        ];
        modules-right = [
          "custom/padd"
          "custom/l_end"
          "tray"
          "battery"
          "custom/r_end"
          "custom/l_end"
          "backlight"
          "network"
          "pulseaudio"
          "pulseaudio#microphone"
          "custom/notifications"
          "custom/r_end"
          "custom/padd"
        ];

        "custom/power" = {
          "format" = "{}";
          "rotate" = 0;
          "exec" = "echo ; echo  logout";
          "on-click" = "wlogout -b 6 -p layer-shell";
          "interval" = 86400;
          "tooltip" = true;
        };

        "wlr/taskbar" = {
          "format" = "{icon}";
          "rotate" = 0;
          "icon-size" = 18;
          "icon-theme" = "Tela-circle-dark";
          "spacing" = 0;
          "tooltip-format" = "{title}";
          "on-click" = "activate";
          "on-click-middle" = "close";
          "ignore-list" = [
            "Alacritty"
          ];
          "app_ids-mapping" = {
            "firefoxdeveloperedition" = "firefox-developer-edition";
          };
        };

        "idle_inhibitor" = {
          "format" = "{icon}";
          "rotate" = 0;
          "format-icons" = {
            "activated" = "󰥔";
            "deactivated" = "";
          };
        };

        "clock" = {
          "format" = "{:%I:%M %p}";
          "rotate" = 0;
          "format-alt" = "{:%R 󰃭 %d·%m·%y}";
          "tooltip-format" = "<span>{calendar}</span>";
          "calendar" = {
            "mode" = "month";
            "mode-mon-col" = 3;
            "on-scroll" = 1;
            "on-click-right" = "mode";
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#ff6699'><b>{}</b></span>";
            };
          };
          "actions" = {
            "on-click-right" = "mode";
            "on-click-forward" = "tz_up";
            "on-click-backward" = "tz_down";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };

        "tray" = {
          "icon-size" = 18;
          "rotate" = 0;
          "spacing" = 5;
        };

        "battery" = {
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 20;
          };
          "format" = "{icon} {capacity}%";
          "rotate" = 0;
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{time} {icon}";
          "format-icons" = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        "backlight" = {
          "device" = "intel_backlight";
          "rotate" = 0;
          "format" = "{icon} {percent}%";
          "format-icons" = ["" "" "" "" "" "" "" "" ""];
          "on-scroll-up" = "brightnessctl set 1%+";
          "on-scroll-down" = "brightnessctl set 1%-";
          "min-length" = 6;
        };

        "network" = {
          "tooltip" = true;
          "format-wifi" = " ";
          "rotate" = 0;
          "format-ethernet" = "󰈀 ";
          "tooltip-format" = "Network: <big><b>{essid}</b></big>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>";
          "format-linked" = "󰈀 {ifname} (No IP)";
          "format-disconnected" = "󰖪 ";
          "tooltip-format-disconnected" = "Disconnected";
          "format-alt" = "<span foreground='#99ffdd'> {bandwidthDownBytes}</span> <span foreground='#ffcc66'> {bandwidthUpBytes}</span>";
          "interval" = 2;
        };

        "pulseaudio" = {
          "format" = "{icon} {volume}";
          "rotate" = 0;
          "format-muted" = "婢";
          "on-click" = "pavucontrol -t 3";
          "on-click-middle" = "volumecontrol.sh -o m";
          "on-scroll-up" = "volumecontrol.sh -o i";
          "on-scroll-down" = "volumecontrol.sh -o d";
          "tooltip-format" = "{icon} {desc} // {volume}%";
          "scroll-step" = 5;
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" ""];
          };
        };

        "pulseaudio#microphone" = {
          "format" = "{format_source}";
          "rotate" = 0;
          "format-source" = "";
          "format-source-muted" = "";
          "on-click" = "pavucontrol -t 4";
          "on-click-middle" = "volumecontrol.sh -i m";
          "on-scroll-up" = "volumecontrol.sh -i i";
          "on-scroll-down" = "volumecontrol.sh -i d";
          "tooltip-format" = "{format_source} {source_desc} // {source_volume}%";
          "scroll-step" = 5;
        };

        "custom/notifications" = {
          "tooltip" = true;
          "tooltip-format" = "Left Click: Launch Notification Center\nRight Click: Do not Disturb";
          "format" = "{} {icon} ";
          "format-icons" = {
            "notification" = "<span foreground='red'><sup></sup></span>";
            "none" = "";
            "dnd-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-none" = "";
            "inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "inhibited-none" = "";
            "dnd-inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-inhibited-none" = "";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          "exec" = "swaync-client -swb";
          "on-click" = "sleep 0.1 && swaync-client -t -sw";
          "on-click-right" = "swaync-client -d -sw";
          "escape" = true;
        };

        "custom/l_end" = {
          "format" = " ";
          "interval" = "once";
          "tooltip" = false;
        };

        "custom/r_end" = {
          "format" = " ";
          "interval" = "once";
          "tooltip" = false;
        };

        "custom/sl_end" = {
          "format" = " ";
          "interval" = "once";
          "tooltip" = false;
        };

        "custom/sr_end" = {
          "format" = " ";
          "interval" = "once";
          "tooltip" = false;
        };

        "custom/rl_end" = {
          "format" = " ";
          "interval" = "once";
          "tooltip" = false;
        };

        "custom/rr_end" = {
          "format" = " ";
          "interval" = "once";
          "tooltip" = false;
        };

        "custom/padd" = {
          "format" = "  ";
          "interval" = "once";
          "tooltip" = false;
        };
      }
    ];

    style = ''
      @define-color bar-bg rgba(0, 0, 0, 0);

      @define-color main-bg #11111b;
      @define-color main-fg #cdd6f4;

      @define-color wb-act-bg #a6adc8;
      @define-color wb-act-fg #313244;

      @define-color wb-hvr-bg #f5c2e7;
      @define-color wb-hvr-fg #313244;

      * {
      border: none;
      border-radius: 0px;
      font-family: "JetBrainsMono Nerd Font";
      font-weight: bold;
      font-size: 10px;
      min-height: 10px;
      }

      window#waybar {
          background: @bar-bg;
      }

      tooltip {
          background: @main-bg;
          color: @main-fg;
          border-radius: 7px;
          border-width: 0px;
      }

      #workspaces button {
          box-shadow: none;
        text-shadow: none;
          padding: 0px;
          border-radius: 9px;
          margin-top: 3px;
          margin-bottom: 3px;
          margin-left: 0px;
          padding-left: 3px;
          padding-right: 3px;
          margin-right: 0px;
          color: @main-fg;
          animation: ws_normal 20s ease-in-out 1;
      }

      #workspaces button.active {
          background: @wb-act-bg;
          color: @wb-act-fg;
          margin-left: 3px;
          padding-left: 12px;
          padding-right: 12px;
          margin-right: 3px;
          animation: ws_active 20s ease-in-out 1;
          transition: all 0.4s cubic-bezier(.55,-0.68,.48,1.682);
      }

      #workspaces button:hover {
          background: @wb-hvr-bg;
          color: @wb-hvr-fg;
          animation: ws_hover 20s ease-in-out 1;
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
      }

      #taskbar button {
          box-shadow: none;
        text-shadow: none;
          padding: 0px;
          border-radius: 9px;
          margin-top: 3px;
          margin-bottom: 3px;
          margin-left: 0px;
          padding-left: 3px;
          padding-right: 3px;
          margin-right: 0px;
          color: @wb-color;
          animation: tb_normal 20s ease-in-out 1;
      }

      #taskbar button.active {
          background: @wb-act-bg;
          color: @wb-act-color;
          margin-left: 3px;
          padding-left: 12px;
          padding-right: 12px;
          margin-right: 3px;
          animation: tb_active 20s ease-in-out 1;
          transition: all 0.4s cubic-bezier(.55,-0.68,.48,1.682);
      }

      #taskbar button:hover {
          background: @wb-hvr-bg;
          color: @wb-hvr-color;
          animation: tb_hover 20s ease-in-out 1;
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
      }

      #tray menu * {
          min-height: 16px
      }

      #tray menu separator {
          min-height: 10px
      }

      #backlight,
      #battery,
      #bluetooth,
      #custom-cliphist,
      #clock,
      #custom-cpuinfo,
      #cpu,
      #custom-gpuinfo,
      #idle_inhibitor,
      #custom-keybindhint,
      #language,
      #memory,
      #mpris,
      #network,
      #custom-notifications,
      #custom-power,
      #pulseaudio,
      #custom-spotify,
      #taskbar,
      #custom-theme,
      #tray,
      #custom-updates,
      #custom-wallchange,
      #custom-wbar,
      #window,
      #workspaces,
      #custom-l_end,
      #custom-r_end,
      #custom-sl_end,
      #custom-sr_end,
      #custom-rl_end,
      #custom-rr_end {
          color: @main-fg;
          background: @main-bg;
          opacity: 1;
          margin: 4px 0px 4px 0px;
          padding-left: 4px;
          padding-right: 4px;
      }

      #workspaces,
      #taskbar {
          padding: 0px;
      }

      #custom-r_end {
          border-radius: 0px 21px 21px 0px;
          margin-right: 9px;
          padding-right: 3px;
      }

      #custom-l_end {
          border-radius: 21px 0px 0px 21px;
          margin-left: 9px;
          padding-left: 3px;
      }

      #custom-sr_end {
          border-radius: 0px;
          margin-right: 9px;
          padding-right: 3px;
      }

      #custom-sl_end {
          border-radius: 0px;
          margin-left: 9px;
          padding-left: 3px;
      }

      #custom-rr_end {
          border-radius: 0px 7px 7px 0px;
          margin-right: 9px;
          padding-right: 3px;
      }

      #custom-rl_end {
          border-radius: 7px 0px 0px 7px;
          margin-left: 9px;
          padding-left: 3px;
      }
    '';
  };
}
