{pkgs, ...}: {
  home.packages = with pkgs; [
    killall
    pciutils
    brightnessctl
    cava
    pamixer
    pavucontrol
    playerctl
    rofi-wayland
    slurp
    swappy
    swww
    wl-clipboard
    hyprpicker
    grim
    grimblast
  ];

  home.file = {
    ".config/uwsm/env" = {
      text = ''
        export GDK_BACKEND='wayland,x11,*'
        export QT_QPA_PLATFORM='wayland;xcb'
        export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
        export QT_AUTO_SCREEN_SCALE_FACTOR=1
        export MOZ_ENABLE_WAYLAND=1
        export ELECTRON_OZONE_PLATFORM_HINT=auto
      '';
      executable = false;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      # hidpi = true;
    };
    # enableNvidiaPatches = false;
    systemd.enable = false;

    settings = {
      exec-once = [
        #"dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        #"systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "uwsm finalize HYPRLAND_INSTANCE_SIGNATURE HYPRLAND_CMD"
        "swww-daemon"
        "killall -q .waybar-wrapped;sleep .5 && waybar"
        "killall -q .swaync-wrapped;sleep .5 && uwsm app -- swaync"
        "uwsm app -- nm-applet --indicator"
        #"dunst"
        "systemctl --user start hyprpolkitagent"
        #"pypr &"
        "swww-random ~/Downloads/wallpapers"
        "wl-paste --watch cliphist store"
      ];

      input = {
        kb_layout = "us";
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0;
        repeat_rate = 50;
        repeat_delay = 300;
        touchpad = {
          natural_scroll = false;
          disable_while_typing = true;
          scroll_factor = 0.8;
        };
      };

      device = {
        name = "compx-2.4g-receiver-mouse";
        sensitivity = -0.5;
      };

      general = {
        "$mainMod" = "SUPER";
        "$terminal" = "kitty";
        "$fileManager" = "thunar";
        "$menu" = "rofi -show drun";
        "$browser" = "firefox";

        layout = "dwindle";
        gaps_in = 2;
        gaps_out = 4;
        border_size = 2;
        resize_on_border = true;
        #"col.active_border" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
        #"col.inactive_border" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
      };

      misc = {
        vrr = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      decoration = {
        rounding = 5;
        dim_special = 0.3;
        blur = {
          enabled = true;
          size = 6;
          passes = 2;
          ignore_opacity = true;
          new_optimizations = true;
          xray = false;
          special = true;
        };
        shadow = {
          enabled = false;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

      bind = [
        "$mainMod, T, exec, uwsm app -- $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod, E, exec, uwsm app -- $fileManager"
        "$mainMod, R, exec, uwsm app -- $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, B, exec, uwsm app -- $browser"
        ''$mainMod, W, exec, hyprctl --batch "dispatch togglefloating; dispatch resizeactive exact 80% 80%; dispatch centerwindow"''
        "$mainMod, G, togglegroup,"
        "Alt, Return, fullscreen,"
        "ALT, Tab, cyclenext"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod+Alt, G, exec, hypr-gamemode"
        "Ctrl+Alt, W, exec, killall .waybar-wrapped || waybar"
        "Ctrl+Alt, S, exec, killall -q swww-random;sleep .5 && swww-random ~/Downloads/wallpapers"
        "$mainMod, Backspace, exec, wlogout -b 6 -p layer-shell"
        "$mainMod, L, exec, pidof hyprlock || hyprlock -q"
        "$mainMod, V, exec, cliphist list | dmenu | cliphist decode | wl-copy"
        "$mainMod, C, exec, cliphist wipe"
        "$mainMod CTRL, left, movewindow, l"
        "$mainMod CTRL, right, movewindow, r"
        "$mainMod CTRL, up, movewindow, u"
        "$mainMod CTRL, down, movewindow, d"
        ", Print, exec, grimblast --notify copysave output"
        "SHIFT, Print, exec, grimblast --notify --freeze copysave area"
        ", XF86PowerOff, exec, wlogout -b 6 -p layer-shell"
      ];

      bindd = [
        "$mainMod+Shift, P,Color Picker , exec, hyprpicker -a"
      ];

      binde = [
        "$mainMod+Shift, Right, resizeactive, 30 0"
        "$mainMod+Shift, Left, resizeactive, -30 0"
        "$mainMod+Shift, Up, resizeactive, 0 -30"
        "$mainMod+Shift, Down, resizeactive, 0 30"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", switch:on:Lid Switch, exec, hyprlock --immediate"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
        "$mainMod, Z, movewindow"
        "$mainMod, X, resizewindow"
      ];

      windowrule = [
        "idleinhibit fullscreen, class:^(.*celluloid.*)$|^(.*mpv.*)$|^(.*vlc.*)$"
        "idleinhibit fullscreen, class:^(.*[Ss]potify.*)$"
        "idleinhibit fullscreen, class:^(.*LibreWolf.*)$|^(.*floorp.*)$|^(.*brave-browser.*)$|^(.*firefox.*)$|^(.*chromium.*)$|^(.*zen.*)$|^(.*vivaldi.*)$"
        "float, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
        "keepaspectratio, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
        "move 73% 72%, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
        "size 25%, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
        "float, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
        "pin, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
        "opacity 0.90 0.90,class:^(firefox)$"
        "opacity 0.90 0.90,class:^(brave-browser)$"
        "opacity 0.80 0.80,class:^(code-oss)$"
        "opacity 0.80 0.80,class:^([Cc]ode)$"
        "opacity 0.80 0.80,class:^(code-url-handler)$"
        "opacity 0.80 0.80,class:^(code-insiders-url-handler)$"
        "opacity 0.80 0.80,class:^(kitty)$"
        "opacity 0.80 0.80,class:^(org.kde.dolphin)$"
        "opacity 0.80 0.80,class:^(org.kde.ark)$"
        "opacity 0.80 0.80,class:^(nwg-look)$"
        "opacity 0.80 0.80,class:^(qt5ct)$"
        "opacity 0.80 0.80,class:^(qt6ct)$"
        "opacity 0.80 0.80,class:^(kvantummanager)$"
        "opacity 0.80 0.70,class:^(org.pulseaudio.pavucontrol)$"
        "opacity 0.80 0.70,class:^(.blueman-manager-wrapped)$"
        "opacity 0.80 0.70,class:^(nm-applet)$"
        "opacity 0.80 0.70,class:^(nm-connection-editor)$"
        "opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "opacity 0.80 0.70,class:^(polkit-gnome-authentication-agent-1)$"
        "opacity 0.80 0.70,class:^(org.freedesktop.impl.portal.desktop.gtk)$"
        "opacity 0.80 0.70,class:^(org.freedesktop.impl.portal.desktop.hyprland)$"
        "opacity 0.70 0.70,class:^([Ss]team)$"
        "opacity 0.70 0.70,class:^(steamwebhelper)$"
        "opacity 0.70 0.70,class:^([Ss]potify)$"
        "opacity 0.70 0.70,initialTitle:^(Spotify Free)$"
        "opacity 0.70 0.70,initialTitle:^(Spotify Premium)$"
        "opacity 0.90 0.90,class:^(com.github.rafostar.Clapper)$"
        "opacity 0.80 0.80,class:^(com.github.tchx84.Flatseal)$"
        "opacity 0.80 0.80,class:^(hu.kramo.Cartridges)$"
        "opacity 0.80 0.80,class:^(com.obsproject.Studio)$"
        "opacity 0.80 0.80,class:^(gnome-boxes)$"
        "opacity 0.80 0.80,class:^(vesktop)$"
        "opacity 0.80 0.80,class:^(discord)$"
        "opacity 0.80 0.80,class:^(WebCord)$"
        "opacity 0.80 0.80,class:^(ArmCord)$"
        "opacity 0.80 0.80,class:^(app.drey.Warp)$"
        "opacity 0.80 0.80,class:^(net.davidotek.pupgui2)$"
        "opacity 0.80 0.80,class:^(yad)$ # Protontricks-Gtk"
        "opacity 0.80 0.80,class:^(Signal)$ # Signal-Gtk"
        "opacity 0.80 0.80,class:^(io.github.alainm23.planify)$"
        "opacity 0.80 0.80,class:^(io.gitlab.theevilskeleton.Upscaler)$"
        "opacity 0.80 0.80,class:^(rofi)$"
        "opacity 0.80 0.80,class:^(com.github.unrud.VideoDownloader)$"
        "opacity 0.80 0.80,class:^(io.gitlab.adhami3310.Impression)$"
        "opacity 0.80 0.80,class:^(io.missioncenter.MissionCenter)$"
        "opacity 0.80 0.80,class:^(io.github.flattool.Warehouse)$"
        "opacity 0.80 0.80,class:^(org.pwmt.zathura)$"
        "opacity 0.80 0.80,class:^(org.qbittorrent.qBittorrent)$"
        "opacity 0.80 0.80,class:^(heroic)$"
        "opacity 0.80 0.80,class:^(org.telegram.desktop)$"
        "opacity 0.80 0.80,class:^(ZapZap)$"
        "opacity 0.80 0.80,class:^(com.mitchellh.ghostty)$"
        "opacity 0.80 0.80,class:^(GTK Application)$"
        "opacity 0.80 0.80,class:^(thunar)$"
        "opacity 0.80 0.80,class:^(com.github.louis77.tuner)$"
        "opacity 0.70 0.70,class:^(org.gnome.clocks)$"
        "opacity 0.70 0.70,class:^(org.gnome.Calculator)$"
        "opacity 0.80 0.80,class:^(imv)$"
        "opacity 0.80 0.80,class:^(com.rtosta.zapzap)$"
        "opacity 0.80 0.80,class:^(localsend_app)$"
        "opacity 0.80 0.80,class:^(org.qbittorrent.qBittorrent)$"
        "float,class:^(org.kde.dolphin)$,title:^(Progress Dialog — Dolphin)$"
        "float,class:^(org.kde.dolphin)$,title:^(Copying — Dolphin)$"
        "float,title:^(About Mozilla Firefox)$"
        "float,class:^(firefox)$,title:^(Picture-in-Picture)$"
        "float,class:^(firefox)$,title:^(Library)$"
        "float,class:^(kitty)$,title:^(top)$"
        "float,class:^(kitty)$,title:^(btop)$"
        "float,class:^(kitty)$,title:^(htop)$"
        "float,class:^(vlc)$"
        "float,class:^(kvantummanager)$"
        "float,class:^(qt5ct)$"
        "float,class:^(qt6ct)$"
        "float,class:^(nwg-look)$"
        "float,class:^(org.kde.ark)$"
        "float,class:^(org.pulseaudio.pavucontrol)$"
        "float,class:^(.blueman-manager-wrapped)$"
        "float,class:^(.nm-applet-wrap)$"
        "float,class:^(nm-connection-editor)$"
        "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "float,class:^(Signal)$"
        "float,class:^(com.github.rafostar.Clapper)$"
        "float,class:^(app.drey.Warp)$"
        "float,class:^(net.davidotek.pupgui2)$ # ProtonUp-Qt"
        "float,class:^(yad)$"
        "float,class:^(eog)$"
        "float,class:^(io.github.alainm23.planify)$"
        "float,class:^(io.gitlab.theevilskeleton.Upscaler)$"
        "float,class:^(com.github.unrud.VideoDownloader)$"
        "float,class:^(io.gitlab.adhami3310.Impression)$"
        "float,class:^(io.missioncenter.MissionCenter)$"
        "float,class:^(xdg-desktop-portal-gtk)$"
        "float,class:^(thunar)$,title:^(File Operation Progress)$"
        "float,class:^(org.gnome.clocks)$"
        "float,class:^(org.gnome.Calculator)$"
        "float,title:^(Open)$"
        "float, title:^(Authentication Required)$"
        "float, title:^(Add Folder to Workspace)$"
        "float,initialtitle:^(Open File)$"
        "float,title:^(Choose Files)$"
        "float,title:^(Save As)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"
        "float,class:^([Xx]dg-desktop-portal-gtk)$"
        "float, title:^(File Upload)(.*)$"
        "float, title:^(Choose wallpaper)(.*)$"
        "float, title:^(Library)(.*)$"
        "float,class:^(.*dialog.*)$"
        "float,title:^(.*dialog.*)$"
      ];

      layerrule = [
        "blur,rofi"
        "ignorezero,rofi"
        "blur,notifications"
        "ignorezero,notifications"
        "blur,swaync-notification-window"
        "ignorezero,swaync-notification-window"
        "ignorealpha 0.5, swaync-notification-window"
        "blur,swaync-control-center"
        "ignorezero,swaync-control-center"
        "ignorealpha 0.5, swaync-control-center"
        "blur,logout_dialog"
        "blur,waybar"
      ];
      #env = [
      #  "GDK_BACKEND, wayland, x11"
      #  "CLUTTER_BACKEND, wayland"
      #  "QT_QPA_PLATFORM=wayland;xcb"
      #  "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
      #  "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
      #  "MOZ_ENABLE_WAYLAND, 1"
      #];
    };
    extraConfig = "
      monitor=,preferred,auto,auto
    ";
  };
}
