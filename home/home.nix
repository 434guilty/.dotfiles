{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  imports = [
    inputs.nvf.homeManagerModules.default
    inputs.catppuccin.homeManagerModules.catppuccin
    ./features/cli
    ./features/desktop
    ./dotfiles
  ];

  catppuccin.flavor = "mocha";

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
    kdePackages.krohnkite
    tela-circle-icon-theme
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
      fonts.enable = true;
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

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 16;
  };

  #for virtualization connection
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
