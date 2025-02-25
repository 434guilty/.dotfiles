{
  pkgs,
  inputs,
  ...
}: let
in {
  environment.systemPackages = with pkgs; [
    killall
    #libappindicator
    libnotify
    pciutils
    xdg-user-dirs
    xdg-utils

    # Hyprland Stuff
    brightnessctl # for brightness control
    cava
    cliphist
    #loupe
    #grim
    hypridle
    #imagemagick
    #inxi
    #jq
    networkmanagerapplet
    pamixer
    pavucontrol
    playerctl
    #polkit_gnome
    pyprland
    rofi-wayland
    slurp
    swappy
    swaynotificationcenter
    swww
    unzip
    wl-clipboard
    wlogout
    xarchiver
    #yad
    hyprpolkitagent
  ];

  programs = {
    hyprland = {
      enable = true;
      #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland; #hyprland development or -git version
      #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland; #xdph-development

      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };

    waybar.enable = true;
    hyprlock.enable = true;
    nm-applet.indicator = true;
    thunar.enable = true;
    thunar.plugins = with pkgs.xfce; [
      exo
      mousepad
      thunar-archive-plugin
      thunar-volman
      tumbler
    ];

    xwayland.enable = true;

    dconf.enable = true;
    #seahorse.enable = true;
    # mtr.enable = true;
    #gnupg.agent = {
    #enable = true;
    #enableSSHSupport = true;
    # };
  };

  # Extra Portal Configuration
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
