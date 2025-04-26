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
      #themeFile = "Catppuccin-Mocha";
      #font.name = "CascadiaCode";
      #font.size = 9;
      settings = {
        cursor_trail = 3;
        enable_audio-bell = "no";
        cursor_text_color = "background";
        tab_bar_edge = "bottom";
        tab_bar_style = "powerline";
        tab_powerline_style = "slanted";
        tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
      };
    };
  };
}
