{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.gaming;
in {
  options.extraServices.gaming.enable = mkEnableOption "enable gaming";

  config = mkIf cfg.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;
    environment.systemPackages = with pkgs; [
      heroic
      protonup-qt
    ];
  };
}
