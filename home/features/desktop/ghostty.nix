{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.ghostty;
in {
  options.features.desktop.ghostty.enable = mkEnableOption "enable ghostty";

  config = mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        #font-size = 10;
        #"custom-shader" = "shaders/bloom025.glsl";
      };
    };
  };
}
