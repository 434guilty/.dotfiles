{
  lib,
  config,
  ...
}:
with lib; let
  inherit (config.lib.stylix) colors;
in {
  home.file.".config/heroic-theme/stylix.css".text = with colors;
  # scss
    ''
      body.catppuccin-mocha {
        --text-default: #${base05};
        --text-secondary: #bac2de;
        --text-tertiary: #11111b;

        --background: #${base00};
        --background-darker: #${base01};
        --background-lighter: #${base02};
        --body-background: #${base00};
        --gradient-body-background: #${base00};
        --input-background: #${base02};
        --controller-hints-background: transparent;
        --current-background: #${base00};
        --modal-background: #11111b;
        --modal-border: #${base0D};
        --osk-background: #${base00};
        --osk-button-background: #${base02};
        --osk-button-border: #11111b;
        --search-bar-background: #${base02};
        --search-bar-border: #${base02};

        --action-icon: #${base05};
        --action-icon-hover: #${base0E};
        --action-icon-active: #${base0D};
        --icons-background: #${base00};

        --primary-button: #${base0D};
        --primary-button-overlay: #74c7ec;
        --secondary-button: #${base0E};
        --secondary-button-overlay: #f5c2e7;
        --tertiary-button: #${base0A};
        --tertiary-button-overlay: #${base09};
        --success-button: #${base0B};
        --disabled-button: #${base01};
        --disabled-button-overlay: #11111b;

        --navbar-active: #${base0D};
        --navbar-inactive: #${base05};
        --navbar-active-background: #${base02};
        --navbar-accent: #${base0E};
        --navbar-background: #${base01};
        --divider: #${base01};

        --success: #${base0B};
        --success-hover: #${base0C};
        --danger: #${base0A};
        --danger-hover: #${base09};

        --primary: #${base0D};
        --secondary: #${base0E};
        --accent: #${base0D};

        --status-success: #${base0B};
        --status-warning: #${base0A};
        --status-danger: #${base08};
        --status-info: #${base0D};

        --neutral-01: #11111b;
        --neutral-02: #${base00};
        --neutral-03: #${base02};
        --neutral-04: #6c7086;
        --neutral-05: #a6adc8;
        --neutral-06: #${base05};
      }

      body.catppuccin-mocha select,
      body.catppuccin-mocha input {
        box-shadow: none !important;
      }
    '';
}
