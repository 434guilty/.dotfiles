{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.flatpak;
in {
  options.extraServices.flatpak.enable = mkEnableOption "enable flatpak";

  config = mkIf cfg.enable {
    services.flatpak.enable = true;
    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-kde];
    xdg.portal.config.common.default = "kde";
    environment.systemPackages = with pkgs; [
      flatpak
    ];
  };
}
