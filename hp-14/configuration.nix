# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./disko-config.nix
    ./extraServices
  ];

  # Bootloader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "intel_iommu=on"
      "iommu=pt"
      "nowatchdog"
      "modprobe.blacklist=iTCO_wdt"
    ];
  };

  networking.hostName = "hp-14"; # Define your hostname.
  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager = {
    enable = true;
    wifi.powersave = true;
  };

  # Set your time zone.
  time.timeZone = "Africa/Addis_Ababa";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  #services.xserver = {
  #  enable = true;
  #};

  systemd.user.services = {
    on-battery-power = {
      enable = true;
      after = ["network.target"];
      wantedBy = ["default.target"];
      description = "On battery power";
      serviceConfig = {
        Type = "simple";
        ExecStartPre = ''/run/current-system/sw/bin/hypr-gamemode'';
        ExecStart = ''${pkgs.pipewire}/bin/pw-cat -p --volume 1.7 ${pkgs.sound-theme-freedesktop}/share/sounds/freedesktop/stereo/power-unplug.oga'';
        ExecStartPost = ''${pkgs.libnotify}/bin/notify-send -i ${pkgs.tela-circle-icon-theme}/share/icons/Tela-circle-dark/symbolic/status/battery-full-symbolic.svg  "Discharging"'';
      };
    };
    on-ac-power = {
      enable = true;
      after = ["network.target"];
      wantedBy = ["default.target"];
      description = "On ac power";
      serviceConfig = {
        Type = "simple";
        ExecStartPre = ''/run/current-system/sw/bin/hypr-gamemode'';
        ExecStart = ''${pkgs.pipewire}/bin/pw-cat -p --volume 1.7 ${pkgs.sound-theme-freedesktop}/share/sounds/freedesktop/stereo/power-plug.oga'';
        ExecStartPost = ''${pkgs.libnotify}/bin/notify-send -i ${pkgs.tela-circle-icon-theme}/share/icons/Tela-circle-dark/symbolic/status/battery-full-charging-symbolic.svg  "Charger Connected"'';
      };
    };
    low-power-hibernate = {
      enable = true;
      after = ["network.target"];
      wantedBy = ["multi-user.target"];
      description = "Hibernate on low battery";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = ''${pkgs.systemdMinimal}/bin/systemctl hibernate'';
      };
    };
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="power_supply", ATTR{online}=="0", TAG+="systemd", ENV{SYSTEMD_USER_WANTS}+="on-battery-power.service"
    SUBSYSTEM=="power_supply", ATTR{online}=="1", TAG+="systemd", ENV{SYSTEMD_USER_WANTS}+="on-ac-power.service"
    SUBSYSTEM=="power_supply", ATTR{status}=="Discharging", ATTR{capacity}=="[0-5]", TAG+="systemd", ENV{SYSTEMD_WANTS}+="low-power-hibernate.service" 
  '';

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=30m
  '';

  services.btrfs.autoScrub.enable = true;

  services.logind.extraConfig = ''
    HandlePowerKey=ignore
  '';

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "${import ./sddm-theme.nix {inherit pkgs;}}";
    settings = {
      Theme = {
        CursorTheme = "Bibata-Modern-Ice";
        CursorSize = 16;
      };
    };
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  #services.gvfs.enable = true;
  services.blueman.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  security.polkit.enable = true;
  security.rtkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (
        subject.isInGroup("users")
          && (
            action.id == "org.freedesktop.login1.reboot" ||
            action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
            action.id == "org.freedesktop.login1.power-off" ||
            action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          )
        )
      {
        return polkit.Result.YES;
      }
    })
  '';
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  services.gvfs.enable = true;
  services.tumbler.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.firefox = {
    enable = true;
  };
  programs.neovim.defaultEditor = true;
  programs.zsh.enable = true;
  programs.nm-applet.enable = true;
  programs.nm-applet.indicator = true;
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    exo
    mousepad
    thunar-archive-plugin
    thunar-volman
    tumbler
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
    ];
  };

  extraServices.auto-cpufreq.enable = true;
  #extraServices.flatpak.enable = true;
  extraServices.gaming.enable = true;
  extraServices.nh.enable = true;
  #extraServices.qemu.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    intel-gpu-tools
    nil
    alejandra
    bibata-cursors
    nix-prefetch-git
    #kdePackages.sddm-kcm
    kdePackages.qtmultimedia #for sddm theme
    tela-circle-icon-theme
    networkmanagerapplet
    hyprpolkitagent
    xarchiver
    (import ./scripts/hypr-gamemode.nix {inherit pkgs;})
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    jetbrains-mono
    font-awesome
    terminus_font
    victor-mono
    nerd-fonts.jetbrains-mono # unstable
    nerd-fonts.fira-code # unstable
    nerd-fonts.fantasque-sans-mono #unstable
    cascadia-code
  ];

  stylix.enable = true;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

  #stylix.image = ./1.webp;

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 16;

  stylix.polarity = "dark";

  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
  };

  stylix.fonts.sizes = {
    applications = 10;
    terminal = 9;
    desktop = 9;
    popups = 9;
  };

  stylix.opacity = {
    #applications = 1.0;
    #terminal = 1.0;
    #desktop = 1.0;
    popups = 0.8;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal
    ];
  };

  users.users.m.shell = pkgs.zsh;

  users.users.m = {
    initialHashedPassword = "$y$j9T$cCoHfEiXMXGrnXM90vWia0$CYotvvBnPtL6edCvvZqx9fPgVsZ9Jkuxk8UoZYW8pw4";
    isNormalUser = true;
    description = "m";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  # Enable the OpenSSH daemon.
  #services.openssh = {
  #  enable = true;
  #  settings.PermitRootLogin = "no";
  #  allowSFTP = true;
  #};

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = ["nix-command" "flakes"];
  };
}
