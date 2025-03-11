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
    ./ghostty.nix
    ./qutebrowser.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
  ];
}
