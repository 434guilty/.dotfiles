{
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.features.desktop.qutebrowser;
in {
  options.features.desktop.qutebrowser.enable = mkEnableOption "enable qutebrowser";

  config = mkIf cfg.enable {
    programs.qutebrowser = {
      enable = true;
    };
  };
}
