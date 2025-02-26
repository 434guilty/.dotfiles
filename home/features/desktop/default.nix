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
    ./rofi.nix
    ./wlogout.nix
    ./dunst.nix
  ];

  home.packages = with pkgs; [
  ];
}
