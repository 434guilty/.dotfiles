{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.mangohud;
in {
  options.features.desktop.mangohud.enable = mkEnableOption "enable extended mangihud configuration";

  config = mkIf cfg.enable {
    programs.mangohud = {
      enable = true;
      settings = {
        fps_only = true;
      };
    };
  };
}
