{
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.features.desktop.firefox;
in {
  options.features.desktop.firefox.enable = mkEnableOption "enable extended firefox configuration";

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
      profiles.m = {
        userChrome = ''
          /* some css */
        '';

        extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
          #ublock-origin
          darkreader
        ];
      };
    };
  };
}
