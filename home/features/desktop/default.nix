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
    ./wlogout
    ./swaync.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./heroic-theme.nix
  ];

  home.packages = with pkgs; [
  ];
}
