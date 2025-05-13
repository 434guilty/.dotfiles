{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
    ./features/cli
    ./features/desktop
    ./dotfiles
  ];

  home.username = "m";
  home.homeDirectory = "/home/m";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    mpv
    yt-dlp
    aria2
    telegram-desktop
    zapzap
    mindustry-wayland
    tuner
    qbittorrent-enhanced
    ladybird
    tela-circle-icon-theme
    handbrake
    mediainfo
    (import ./scripts/swww-random.nix {inherit pkgs;})
    #(import ./scripts/hypr-gamemode.nix {inherit pkgs;})
    libnotify
    cliphist
    unrar
    unzip
    imv
    gnome-clocks
    mullvad-browser
    gnome-calculator
  ];

  features = {
    cli = {
      zsh.enable = true;
      fzf.enable = true;
      fastfetch.enable = true;
      starship.enable = true;
      btop.enable = true;
    };
    desktop = {
      firefox.enable = true;
      kitty.enable = true;
      #mangohud.enable = true;
      yazi.enable = true;
      nvf.enable = true;
      #ghostty.enable = true;
      qutebrowser.enable = true;
      zathura.enable = true;
    };
  };

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "kitty";
  };

  programs.git = {
    enable = true;
    userName = "m";
    userEmail = "musabmohamm@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.lazygit.enable = true;

  #for virtualization connection
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  services.blueman-applet.enable = true;

  stylix.targets.waybar.enable = false;

  stylix.targets.swaync.enable = false;

  stylix.targets.rofi.enable = false;

  stylix.targets.hyprlock.enable = false;

  stylix.iconTheme.enable = true;

  stylix.iconTheme.package = pkgs.tela-circle-icon-theme;

  stylix.iconTheme.dark = "Tela-circle-dark";

  stylix.iconTheme.light = "Tela-circle-light";

  stylix.polarity = "dark";

  stylix.targets.firefox.profileNames = ["m"];

  #services.dunst.settings.global.separator_color = lib.mkForce "transparent";
  #wayland.windowManager.hyprland.settings.general."col.active_border" = lib.mkForce "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
  #wayland.windowManager.hyprland.settings.general."col.inactive_border" = lib.mkForce "rgba(b4befecc) rgba(6c7086cc) 45deg";

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = ["org.pwmt.zathura.desktop"];
    };
    defaultApplications = {
      "application/pdf" = ["org.pwmt.zathura.desktop"];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
