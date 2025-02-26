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
    ./swaync.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];

  home.packages = with pkgs; [
  ];
}
