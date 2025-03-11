{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.zathura;
in {
  options.features.desktop.zathura.enable = mkEnableOption "enable zathura";

  config = mkIf cfg.enable {
    programs.zathura = {
      enable = true;
    };
  };
}
