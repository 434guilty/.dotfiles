{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.cli.zsh;
in {
  options.features.cli.zsh.enable = mkEnableOption "enable extended zsh configuration";

  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      initContent = "colorscript -e blocks1";
      enableCompletion = true;
      autosuggestion.enable = true;
      sessionVariables = {
        EDITOR = "nvim";
      };
      syntaxHighlighting.enable = true;
      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";
        ls = "eza";
        grep = "rg";
        ps = "procs";
      };
    };
  };
}
