{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.nvf;
in {
  options.features.desktop.nvf.enable = mkEnableOption "enable nvf";

  config = mkIf cfg.enable {
    programs.nvf = {
      enable = true;
      defaultEditor = true;
      enableManpages = true;
      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;
          #theme = {
          #  enable = true;
          #  name = "catppuccin";
          #  style = "mocha";
          #};
          languages = {
            enableLSP = true;
            enableTreesitter = true;

            nix.enable = true;
            lua.enable = true;
            bash.enable = true;
          };
          statusline.lualine.enable = true;
          telescope.enable = true;
          autocomplete.nvim-cmp.enable = true;
          visuals.indent-blankline.enable = true;
          options = {
            shiftwidth = 2;
            tabstop = 2;
          };
          git.enable = true;
          filetree.neo-tree.enable = true;
          keymaps = [
            {
              key = "|";
              mode = ["n"];
              silent = true;
              action = ":Neotree reveal<cr>";
            }
          ];
          dashboard.alpha.enable = true;
          terminal.toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
          binds.whichKey.enable = true;
        };
      };
    };
  };
}
