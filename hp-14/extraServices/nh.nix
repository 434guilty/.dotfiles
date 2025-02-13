{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.nh;
in {
  options.extraServices.nh.enable = mkEnableOption "enable nh";

  config = mkIf cfg.enable {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/m/.dotfiles";
    };
    environment.systemPackages = with pkgs; [
      nix-output-monitor
      nvd
    ];
  };
}
