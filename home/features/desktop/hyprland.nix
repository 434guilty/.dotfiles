{pkgs, ...}: {
  home.packages = with pkgs; [
    killall
    pciutils
    brightnessctl
    cava
    pamixer
    pavucontrol
    playerctl
    rofi
    slurp
    swappy
    swww
    wl-clipboard
    hyprpicker
    grim
    grimblast
    dmenu
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
        name = "2.4g-mouse";
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
        vfr = true;
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
        "idle_inhibit fullscreen true, match:class ^(.*celluloid.*)$|^(.*mpv.*)$|^(.*vlc.*)$"
        "idle_inhibit fullscreen true, match:class ^(.*[Ss]potify.*)$"
        "idle_inhibit fullscreen true, match:class ^(.*LibreWolf.*)$|^(.*floorp.*)$|^(.*brave-browser.*)$|^(.*firefox.*)$|^(.*chromium.*)$|^(.*zen.*)$|^(.*vivaldi.*)$"

        "match:title = ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
        "tag = +picture-in-picture"
        "float = true"
        "keep_aspect_ratio = true"
        "move = (monitor_w*0.73) (monitor_h*0.72)"
        "size = (monitor_w*0.25) (monitor_h*0.25)"
        "pin = true" 
          
     "opacity 0.90 0.90, match:class ^(firefox)$"
     "opacity 0.90 0.90, match:class ^(brave-browser)$"
     "opacity 0.80 0.80, match:class ^(code-oss)$"
     "opacity 0.80 0.80, match:class ^([Cc]ode)$"
     "opacity 0.80 0.80, match:class ^(code-url-handler)$"
     "opacity 0.80 0.80, match:class ^(code-insiders-url-handler)$"
     "opacity 0.80 0.80, match:class ^(kitty)$"
     "opacity 0.80 0.80, match:class ^(org.kde.dolphin)$"
     "opacity 0.80 0.80, float on, match:class ^(org.kde.ark)$"
     "opacity 0.80 0.80, float on, match:class ^(nwg-look)$"
     "opacity 0.80 0.80, float on, match:class ^(qt5ct)$"
     "opacity 0.80 0.80, float on, match:class ^(qt6ct)$"
     "opacity 0.80 0.80, float on, match:class ^(kvantummanager)$"
     "opacity 0.80 0.70, float on, match:class ^(org.pulseaudio.pavucontrol)$"
     "opacity 0.80 0.70, float on, match:class ^(.blueman-manager-wrapped)$"
     "opacity 0.80 0.70, match:class ^(net.lutris.Lutris)$"
     "opacity 0.80 0.70, match:class ^(nm-applet)$"
     "opacity 0.80 0.70, float on, match:class ^(nm-connection-editor)$"
     "opacity 0.80 0.70, float on, match:class ^(org.kde.polkit-kde-authentication-agent-1)$"
     "opacity 0.80 0.70, match:class ^(polkit-gnome-authentication-agent-1)$"
     "opacity 0.80 0.70, match:class ^(org.freedesktop.impl.portal.desktop.gtk)$"
     "opacity 0.80 0.70, match:class ^(org.freedesktop.impl.portal.desktop.hyprland)$"
     "opacity 0.70 0.70, match:class ^([Ss]team)$"
     "opacity 0.70 0.70, match:class ^(steamwebhelper)$"
     "opacity 0.70 0.70, match:class ^([Ss]potify)$"
     "opacity 0.70 0.70, match:initial_title ^(Spotify Free)$"
     "opacity 0.70 0.70, match:initial_title ^(Spotify Premium)$"
     "opacity 0.90 0.90, float on, match:class ^(com.github.rafostar.Clapper)$"
     "opacity 0.80 0.80, match:class ^(com.github.tchx84.Flatseal)$"
     "opacity 0.80 0.80, match:class ^(hu.kramo.Cartridges)$"
     "opacity 0.80 0.80, match:class ^(com.obsproject.Studio)$"
     "opacity 0.80 0.80, match:class ^(gnome-boxes)$"
     "opacity 0.80 0.80, match:class ^(vesktop)$"
     "opacity 0.80 0.80, match:class ^(discord)$"
     "opacity 0.80 0.80, match:class ^(WebCord)$"
     "opacity 0.80 0.80, match:class ^(ArmCord)$"
     "opacity 0.80 0.80, float on, match:class ^(app.drey.Warp)$"
     "opacity 0.80 0.80, match:class ^(net.davidotek.pupgui2)$"
     "opacity 0.80 0.80, match:class ^(yad)$ # Protontricks-Gtk"
     "opacity 0.80 0.80, match:class ^(Signal)$ # Signal-Gtk"
     "opacity 0.80 0.80, float on, match:class ^(io.github.alainm23.planify)$"
     "opacity 0.80 0.80, float on, match:class ^(io.gitlab.theevilskeleton.Upscaler)$"
     "opacity 0.80 0.80, match:class ^(rofi)$"
     "opacity 0.80 0.80, float on, match:class ^(com.github.unrud.VideoDownloader)$"
     "opacity 0.80 0.80, float on, match:class ^(io.gitlab.adhami3310.Impression)$"
     "opacity 0.80 0.80, float on, match:class ^(io.missioncenter.MissionCenter)$"
     "opacity 0.80 0.80, match:class ^(io.github.flattool.Warehouse)$"
     "opacity 0.80 0.80, match:class ^(org.pwmt.zathura)$"
     "opacity 0.80 0.80, match:class ^(org.qbittorrent.qBittorrent)$"
     "opacity 0.80 0.80, match:class ^(heroic)$"
     "opacity 0.80 0.80, match:class ^(org.telegram.desktop)$"
     "opacity 0.80 0.80, match:class ^(ZapZap)$"
     "opacity 0.80 0.80, match:class ^(com.mitchellh.ghostty)$"
     "opacity 0.80 0.80, match:class ^(GTK Application)$"
     "opacity 0.80 0.80, match:class ^(thunar)$"
     "opacity 0.80 0.80, match:class ^(com.github.louis77.tuner)$"
     "opacity 0.70 0.70, float on, match:class ^(org.gnome.clocks)$"
     "opacity 0.70 0.70, float on, match:class ^(org.gnome.Calculator)$"
     "opacity 0.80 0.80, match:class ^(imv)$"
     "opacity 0.80 0.80, match:class ^(com.rtosta.zapzap)$"
     "opacity 0.80 0.80, match:class ^(localsend_app)$"
     "float on, match:class ^(org.kde.dolphin)$, match:title ^(Progress Dialog — Dolphin)$"
     "float on, match:class ^(org.kde.dolphin)$, match:title ^(Copying — Dolphin)$"
     "float on, match:title ^(About Mozilla Firefox)$"
     "float on, match:class ^(firefox)$, match:title ^(Picture-in-Picture)$"
     "float on, match:class ^(firefox)$, match:title ^(Library)$"
     "float on, match:class ^(kitty)$, match:title ^(top)$"
     "float on, match:class ^(kitty)$, match:title ^(btop)$"
     "float on, match:class ^(kitty)$, match:title ^(htop)$"
     "float on, match:class ^(vlc)$"
     "float on, match:class ^(.nm-applet-wrap)$"
     "float on, match:class ^(Signal)$"
     "float on, match:class ^(net.davidotek.pupgui2)$ # ProtonUp-Qt"
     "float on, match:class ^(yad)$"
     "float on, match:class ^(eog)$"
     "float on, match:class ^(xdg-desktop-portal-gtk)$"
     "float on, match:class ^(thunar)$, match:title ^(File Operation Progress)$"
     "float on, match:title ^(Open)$"
     "float on, match:title ^(Authentication Required)$"
     "float on, match:title ^(Add Folder to Workspace)$"
     "float on, match:initial_title ^(Open File)$"
     "float on, match:title ^(Choose Files)$"
     "float on, match:title ^(Save As)$"
     "float on, match:title ^(Confirm to replace files)$"
     "float on, match:title ^(File Operation Progress)$"
     "float on, match:class ^([Xx]dg-desktop-portal-gtk)$"
     "float on, match:title ^(File Upload)(.*)$"
     "float on, match:title ^(Choose wallpaper)(.*)$"
     "float on, match:title ^(Library)(.*)$"
     "float on, match:class ^(.*dialog.*)$"
     "float on, match:title ^(.*dialog.*)$ "
      ];

      layerrule = [
      "blur true,match:namespace rofi"
      "ignore_alpha 0,match:namespace rofi"
      "blur true,match:namespace notifications"
      "ignore_alpha 0,match:namespace notifications"
      "blur true,match:namespace swaync-notification-window"
      "ignore_alpha 0,match:namespace swaync-notification-window"
      "blur true,match:namespace swaync-control-center"
      "ignore_alpha 0,match:namespace swaync-control-center"
      "blur true,match:namespace logout_dialog"
 
      ];
      env = [
      #  "GDK_BACKEND, wayland, x11"
      #  "CLUTTER_BACKEND, wayland"
      #  "QT_QPA_PLATFORM=wayland;xcb"
      #  "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
      #  "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
      #  "MOZ_ENABLE_WAYLAND, 1"
         "XDG_CURRENT_DESKTOP,Hyprland"
      ];
    };
    extraConfig = "
      monitor=,preferred,auto,auto
    ";
  };
}
