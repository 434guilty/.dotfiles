{config, ...}: {
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      "control-center-margin-top" = 7;
      "control-center-margin-bottom" = 10;
      "control-center-margin-right" = 7;
      "control-center-margin-left" = 5;
      "notification-window-width" = 300;
      "fit-to-screen" = false;
      "control-center-height" = 600;
      "control-center-width" = 500;
      "timeout" = 7;
      "timeout-low" = 3;
      "timeout-critical" = 0;
      "image-visibility" = "when available";
      "notification-icon-size" = 24;
      "notification-body-image-height" = 100;
      "notification-body-image-width" = 100;
      "hide-on-clear" = true;
    };
  };
}
