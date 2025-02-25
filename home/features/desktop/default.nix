{pkgs, ...}: {
  imports = [
    ./fonts.nix
    ./firefox.nix
    ./kitty.nix
    ./mangohud.nix
    ./yazi.nix
    ./nvf.nix
    ./hyprland.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
  ];
}
