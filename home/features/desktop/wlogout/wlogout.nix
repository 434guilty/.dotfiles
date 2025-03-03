{config, ...}: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        "label" = "lock";
        "action" = "hyprlock";
        "text" = "Lock";
        "keybind" = "l";
      }

      {
        "label" = "logout";
        "action" = "loginctl kill-session $XDG_SESSION_ID";
        "text" = "Logout";
        "keybind" = "e";
      }

      {
        "label" = "suspend";
        "action" = "hyprlock & disown && systemctl suspend";
        "text" = "Suspend";
        "keybind" = "u";
      }

      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "text" = "Shutdown";
        "keybind" = "s";
      }

      {
        "label" = "hibernate";
        "action" = "systemctl hibernate";
        "text" = "Hibernate";
        "keybind" = "h";
      }

      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      }
    ];
    style = ''
      * {
        font-family: "JetBrainsMono NF", FontAwesome, sans-serif;
      	background-image: none;
      	transition: 20ms;
      }

      window {
      	background-color: transparent;
      }
      button {
        color: #a6adc8;
        background-color: rgba(30,30,46,0.8);
        outline-style: none;
        border: none;
        border-width: 0px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 20%;
        border-radius: 0px;
        box-shadow: none;
        text-shadow: none;
        animation: gradient_f 20s ease-in infinite;
      }

      button:focus {
        background-color: rgba(166,173,200,0.8);
        background-size: 30%;
        color: #1e1e2e;
      }

      button:hover {
        background-color: rgba(245,194,231,0.8);
        background-size: 40%;
        border-radius: 20px;
        animation: gradient_f 20s ease-in infinite;
        transition: all 0.3s cubic-bezier(.55,0.0,.28,1.682);
        color: #1e1e2e;
      }

      button:hover#lock {
        border-radius: 30px;
        margin : -15px -0px -15px 0px;
      }

      button:hover#logout {
        border-radius: 30px;
        margin : -15px 0px -15px 0px;
      }

      button:hover#suspend {
        border-radius: 30px;
        margin : -15px 0px -15px 0px;
      }

      button:hover#shutdown {
        border-radius: 30px;
        margin : -15px 0px -15px 0px;
      }

      button:hover#hibernate {
        border-radius: 30px;
        margin : -15px 0px -15px 0px;
      }
      button:hover#reboot {
        border-radius: 30px;
        margin : -15px 0px -15px 0px;
      }

      #lock {
         margin : 25px 0px 25px 0px;
         border-radius: 50px 0px 0px 50px;
         background-image: image(url("icons/lock_white.png"));
      }

      #logout {
         margin : 25px 0px 25px 0px;
         border-radius: 0px 0px 0px 0px;
         background-image: image(url("icons/logout_white.png"));
      }

      #suspend {
         margin : 25px 0px 25px 0px;
         border-radius: 0px 0px 0px 0px;
         background-image: image(url("icons/suspend_white.png"));
      }

      #shutdown {
         margin: 25px 0px 25px 0px;
         border-radius: 0px 0px 0px 0px;
         background-image: image(url("icons/shutdown_white.png"));
      }

      #hibernate {
         margin: 25px 0px 25px 0px;
         border-radius: 0px 0px 0px 0px;
         background-image: image(url("icons/hibernate_white.png"));
      }

      #reboot {
         margin: 25px 0px 25px 0px;
         border-radius: 0px 50px 50px 0px;
         background-image: image(url("icons/reboot_white.png"));
      }
    '';
  };
  home.file.".config/wlogout/icons" = {
    source = ./icons;
    recursive = true;
  };
}
