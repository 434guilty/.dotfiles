{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.yazi;
in {
  options.features.desktop.yazi.enable = mkEnableOption "enable extended yazi configuration";

  config = mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      shellWrapperName = "y";
    };
  };
}
