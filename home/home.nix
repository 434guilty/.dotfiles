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
    zathura
    telegram-desktop
    zapzap
    krename
    ventoy
    mindustry-wayland
    tuner
    qbittorrent-enhanced
    ladybird
    tela-circle-icon-theme
    handbrake
    mediainfo
    (import ./scripts/swww-random.nix {inherit pkgs;})
    (import ./scripts/hypr-gamemode.nix {inherit pkgs;})
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
      mangohud.enable = true;
      yazi.enable = true;
      nvf.enable = true;
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

  gtk = {
    enable = true;
    iconTheme = {
      name = "Tela-circle-dark";
      package = pkgs.tela-circle-icon-theme;
    };
  };

  #for virtualization connection
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  services.blueman-applet.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
