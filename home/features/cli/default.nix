{pkgs, ...}: {
  imports = [
    ./zsh.nix
    ./fzf.nix
    ./fastfetch.nix
    ./starship.nix
    ./btop.nix
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    extraOptions = ["-l" "--icons" "--git" "-a"];
  };

  programs.bat = {enable = true;};

  home.packages = with pkgs; [
    coreutils
    fd
    btop
    jq
    procs
    ripgrep
    tldr
    zip
    dwt1-shell-color-scripts
    fastfetch
    wl-clipboard
  ];
  }
