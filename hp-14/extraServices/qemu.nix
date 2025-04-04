{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.qemu;
in {
  options.extraServices.qemu.enable = mkEnableOption "enable qemu";

  config = mkIf cfg.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = false;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            })
            .fd
          ];
        };
      };
    };
    virtualisation.spiceUSBRedirection.enable = true;
    programs.virt-manager.enable = true;
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true; # enable copy and paste between host and guest
    environment.systemPackages = with pkgs; [
    ];
  };
}
