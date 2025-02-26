{config, ...}: {
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-margin-top = 5;
      control-center-margin-bottom = 5;
      control-center-margin-right = 5;
      control-center-margin-left = 5;
      notification-icon-size = 16;
      notification-body-image-height = 50;
      notification-body-image-width = 100;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = false;
      control-center-width = 150;
      control-center-height = 250;
      notification-window-width = 250;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widget-config = {
        title = {
          text = "Notification Center";
          clear-all-button = true;
          button-text = "󰆴 Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 1;
          text = "Notification Center";
        };
        mpris = {
          image-size = 56;
          image-radius = 4;
        };
        volume = {
          label = "󰕾";
        };
        backlight = {
          label = "󰃟";
        };
      };
      widgets = [
        "title"
        "mpris"
        "volume"
        "backlight"
        "dnd"
        "notifications"
      ];
    };
    style = ''
      * {
        font-family: JetBrainsMono Nerd Font Mono;
        font-weight: bold;
      }
      .control-center .notification-row:focus,
      .control-center .notification-row:hover {
        opacity: 0.9;
        background: #${config.lib.stylix.colors.base00}
      }
      .notification-row {
        outline: none;
        margin: 5px;
        padding: 0;
      }
      .notification {
        background: transparent;
        padding: 0;
        margin: 0px;
      }
      .notification-content {
        background: #${config.lib.stylix.colors.base00};
        padding: 5px;
        border-radius: 3px;
        border: 2px solid #${config.lib.stylix.colors.base0D};
        margin: 0;
      }
      .notification-default-action {
        margin: 0;
        padding: 0;
        border-radius: 3px;
      }
      .close-button {
        background: #${config.lib.stylix.colors.base08};
        color: #${config.lib.stylix.colors.base00};
        text-shadow: none;
        padding: 0;
        border-radius: 3px;
        margin-top: 3px;
        margin-right: 3px;
      }
      .close-button:hover {
        box-shadow: none;
        background: #${config.lib.stylix.colors.base0D};
        transition: all .15s ease-in-out;
        border: none
      }
      .notification-action {
        border: 2px solid #${config.lib.stylix.colors.base0D};
        border-top: none;
        border-radius: 3px;
      }
      .notification-default-action:hover,
      .notification-action:hover {
        color: #${config.lib.stylix.colors.base0B};
        background: #${config.lib.stylix.colors.base0B}
      }
      .notification-default-action {
        border-radius: 3px;
        margin: 0px;
      }
      .notification-default-action:not(:only-child) {
        border-bottom-left-radius: 4px;
        border-bottom-right-radius: 4px
      }
      .notification-action:first-child {
        border-bottom-left-radius: 5px;
        background: #${config.lib.stylix.colors.base00}
      }
      .notification-action:last-child {
        border-bottom-right-radius: 5px;
        background: #${config.lib.stylix.colors.base00}
      }
      .inline-reply {
        margin-top: 5px
      }
      .inline-reply-entry {
        background: #${config.lib.stylix.colors.base00};
        color: #${config.lib.stylix.colors.base05};
        caret-color: #${config.lib.stylix.colors.base05};
        border: 1px solid #${config.lib.stylix.colors.base09};
        border-radius: 3px
      }
      .inline-reply-button {
        margin-left: 2px;
        background: #${config.lib.stylix.colors.base00};
        border: 1px solid #${config.lib.stylix.colors.base09};
        border-radius: 3px;
        color: #${config.lib.stylix.colors.base05}
      }
      .inline-reply-button:disabled {
        background: initial;
        color: #${config.lib.stylix.colors.base03};
        border: 1px solid transparent
      }
      .inline-reply-button:hover {
        background: #${config.lib.stylix.colors.base00}
      }
      .body-image {
        margin-top: 3px;
        background-color: #${config.lib.stylix.colors.base05};
        border-radius: 3px
      }
      .summary {
        font-size: 10px;
        font-weight: 700;
        background: transparent;
        color: rgba(158, 206, 106, 1);
        text-shadow: none
      }
      .time {
        font-size: 10px;
        font-weight: 700;
        background: transparent;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
        margin-right: 18px
      }
      .body {
        font-size: 10px;
        font-weight: 400;
        background: transparent;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none
      }
      .control-center {
        background: #${config.lib.stylix.colors.base00};
        border: 2px solid #${config.lib.stylix.colors.base0C};
        border-radius: 5px;
      }
      .control-center-list {
        background: transparent
      }
      .control-center-list-placeholder {
        opacity: .5
      }
      .floating-notifications {
        background: transparent
      }
      .blank-window {
        background: alpha(black, 0)
      }
      .widget-title {
        color: #${config.lib.stylix.colors.base0B};
        background: #${config.lib.stylix.colors.base00};
        padding: 3px 5px;
        margin: 5px 5px 3px 5px;
        font-size: 1.5rem;
        border-radius: 5px;
      }
      .widget-title>button {
        font-size: 1rem;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
        background: #${config.lib.stylix.colors.base00};
        box-shadow: none;
        border-radius: 3px;
      }
      .widget-title>button:hover {
        background: #${config.lib.stylix.colors.base08};
        color: #${config.lib.stylix.colors.base00};
      }
      .widget-dnd {
        background: #${config.lib.stylix.colors.base00};
        padding: 3px 5px;
        margin: 5px 5px 3px 5px;
        border-radius: 3px;
        font-size: large;
        color: #${config.lib.stylix.colors.base0B};
      }
      .widget-dnd>switch {
        border-radius: 3px;
        /* border: 1px solid #${config.lib.stylix.colors.base0B}; */
        background: #${config.lib.stylix.colors.base0B};
      }
      .widget-dnd>switch:checked {
        background: #${config.lib.stylix.colors.base08};
        border: 1px solid #${config.lib.stylix.colors.base08};
      }
      .widget-dnd>switch slider {
        background: #${config.lib.stylix.colors.base00};
        border-radius: 3px
      }
      .widget-dnd>switch:checked slider {
        background: #${config.lib.stylix.colors.base00};
        border-radius: 3px
      }
      .widget-label {
          margin: 5px 5px 3px 5px;
      }
      .widget-label>label {
        font-size: 1rem;
        color: #${config.lib.stylix.colors.base05};
      }
      .widget-mpris {
        color: #${config.lib.stylix.colors.base05};
        padding: 3px 5px;
        margin: 5px 5px 3px 5px;
        border-radius: 3px;
      }
      .widget-mpris > box > button {
        border-radius: 3px;
      }
      .widget-mpris-player {
        padding: 3px 5px;
        margin: 5px
      }
      .widget-mpris-title {
        font-weight: 700;
        font-size: 1.25rem
      }
      .widget-mpris-subtitle {
        font-size: 1.1rem
      }
      .widget-menubar>box>.menu-button-bar>button {
        border: none;
        background: transparent
      }
      .topbar-buttons>button {
        border: none;
        background: transparent
      }
      .widget-volume {
        background: #${config.lib.stylix.colors.base01};
        padding: 5px;
        margin: 5px 5px 3px 5px;
        border-radius: 3px;
        font-size: x-large;
        color: #${config.lib.stylix.colors.base05};
      }
      .widget-volume>box>button {
        background: #${config.lib.stylix.colors.base0B};
        border: none
      }
      .per-app-volume {
        background-color: #${config.lib.stylix.colors.base00};
        padding: 2px 4px 2px;
        margin: 0 4px 4px;
        border-radius: 3px;
      }
      .widget-backlight {
        background: #${config.lib.stylix.colors.base01};
        padding: 3px;
        margin: 5px 5px 3px 5px;
        border-radius: 3px;
        font-size: x-large;
        color: #${config.lib.stylix.colors.base05}
      }
    '';
  };
}
