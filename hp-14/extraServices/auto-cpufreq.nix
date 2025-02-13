{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.extraServices.auto-cpufreq;
in {
  options.extraServices.auto-cpufreq.enable = mkEnableOption "enable auto-cpufreq";

  config = mkIf cfg.enable {
    services = {
      thermald.enable = true;
      power-profiles-daemon.enable = false;
      auto-cpufreq.enable = true;
    };
  };
}
