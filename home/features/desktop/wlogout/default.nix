{pkgs, ...}: {
  imports = [
    ./wlogout.nix
  ];

  home.packages = with pkgs; [
  ];
}
