{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.kitty;
in {
  options.features.desktop.kitty.enable = mkEnableOption "enable extended kitty configuration";

  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = true;
      themeFile = "Catppuccin-Mocha";
      font.name = "CascadiaCode";
      font.size = 9;
      settings = {
        cursor_trail = 3;
        enable_audio-bell = "no";
        cursor_text_color = "background";
      };
    };
  };
}
