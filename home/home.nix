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
    tela-circle-icon-theme
    #handbrake
    mediainfo
    #libnotify
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
      #qutebrowser.enable = true;
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
    settings = {
      user = {
       name = "m";
       email = "musabmohamm@gmail.com";
      };  
      init.defaultBranch = "main";
    };
  };

  programs.lutris.enable = true;

  programs.gitui.enable = true;

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };


  stylix.icons.enable = true;

  stylix.icons.package = pkgs.tela-circle-icon-theme;

  stylix.icons.dark = "Tela-circle-dark";

  stylix.icons.light = "Tela-circle-light";

  stylix.polarity = "dark";

  stylix.targets.firefox.profileNames = ["m"];

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
